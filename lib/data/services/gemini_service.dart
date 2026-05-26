import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../../core/constants/gemini_constants.dart';
import '../../core/utils/json_parser.dart';
import 'flutter_secure_storage_stub.dart';
import 'gemini_errors.dart';

abstract class GeminiTextClient {
  Future<String?> generateText({
    required String apiKey,
    required String prompt,
  });
}

class GoogleGenerativeAiTextClient implements GeminiTextClient {
  const GoogleGenerativeAiTextClient();

  @override
  Future<String?> generateText({
    required String apiKey,
    required String prompt,
  }) async {
    final model = GenerativeModel(
      model: GeminiConstants.model,
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.2,
        responseMimeType: 'application/json',
      ),
    );
    final response = await model.generateContent([Content.text(prompt)]);
    return response.text;
  }
}

class GeminiService {
  GeminiService(
    this._secureStorage, {
    this.client = const GoogleGenerativeAiTextClient(),
  });

  static const apiKeyStorageKey = 'gemini_api_key';

  final FlutterSecureStorage _secureStorage;
  final GeminiTextClient client;

  Future<bool> hasApiKey() async {
    const String apiKey = 'YOUR_GEMINI_API_KEY_HERE';
    return apiKey.trim().isNotEmpty;
  }

  Future<void> saveApiKey(String apiKey) {
    return _secureStorage.write(
      key: apiKeyStorageKey,
      value: apiKey.trim(),
    );
  }

  Future<Map<String, dynamic>> generateSpec({
    required String rawIdea,
    required String questionnaireJson,
  }) async {
    const String apiKey = 'YOUR_GEMINI_API_KEY_HERE';
    if (apiKey.trim().isEmpty) {
      throw GeminiMissingKeyException();
    }

    try {
      final text = await client.generateText(
        apiKey: apiKey,
        prompt: _buildPrompt(rawIdea, questionnaireJson),
      );
      if (text == null || text.trim().isEmpty) {
        throw GeminiInvalidJsonException();
      }
      final parsed = parseSpecJson(text);
      if (!hasRequiredSpecFields(parsed)) {
        throw GeminiIncompleteSchemaException();
      }
      return parsed;
    } on GeminiInvalidJsonException {
      rethrow;
    } on GeminiIncompleteSchemaException {
      rethrow;
    } on FormatException {
      throw GeminiInvalidJsonException();
    } on SocketException catch (error) {
      throw GeminiNetworkException(error.message);
    } on TimeoutException catch (error) {
      throw GeminiNetworkException(error.message ?? 'Network timeout.');
    } on Object catch (error) {
      final text = error.toString();
      final lower = text.toLowerCase();
      if (text.contains('429') ||
          lower.contains('rate limit') ||
          lower.contains('quota')) {
        throw GeminiRateLimitException();
      }
      if (lower.contains('network') ||
          lower.contains('socket') ||
          lower.contains('connection')) {
        throw GeminiNetworkException(text);
      }
      throw GeminiNetworkException(text);
    }
  }

  String encodeSpec(Map<String, dynamic> spec) {
    return const JsonEncoder.withIndent('  ').convert(spec);
  }

  String _buildPrompt(String rawIdea, String questionnaireJson) {
    return '$kGeminiSystemPrompt\n\n'
        'Raw idea:\n$rawIdea\n\n'
        'Questionnaire answers JSON:\n$questionnaireJson';
  }
}
