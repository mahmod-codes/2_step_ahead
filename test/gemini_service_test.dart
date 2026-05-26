import 'package:flutter_application_1/data/services/gemini_errors.dart';
import 'package:flutter_application_1/data/services/gemini_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  test('testGeminiServiceStripsMarkdownFences', () async {
    FlutterSecureStorage.setMockInitialValues({
      GeminiService.apiKeyStorageKey: 'key',
    });
    final service = GeminiService(
      const FlutterSecureStorage(),
      client: _FakeGeminiClient(_fullSpecResponse(markdown: true)),
    );

    final spec = await service.generateSpec(
      rawIdea: 'Idea',
      questionnaireJson: '{}',
    );

    expect(spec['overview'], isA<Map<String, dynamic>>());
  });

  test('testGeminiServiceThrowsInvalidJsonForMalformedResponse', () async {
    FlutterSecureStorage.setMockInitialValues({
      GeminiService.apiKeyStorageKey: 'key',
    });
    final service = GeminiService(
      const FlutterSecureStorage(),
      client: _FakeGeminiClient('not json'),
    );

    expect(
      () => service.generateSpec(rawIdea: 'Idea', questionnaireJson: '{}'),
      throwsA(isA<GeminiInvalidJsonException>()),
    );
  });

  test('testGeminiServiceThrowsIncompleteSchemaForMissingKeys', () async {
    FlutterSecureStorage.setMockInitialValues({
      GeminiService.apiKeyStorageKey: 'key',
    });
    final service = GeminiService(
      const FlutterSecureStorage(),
      client: _FakeGeminiClient('{"overview":{}}'),
    );

    expect(
      () => service.generateSpec(rawIdea: 'Idea', questionnaireJson: '{}'),
      throwsA(isA<GeminiIncompleteSchemaException>()),
    );
  });

  test('testGeminiServiceThrowsMissingKeyWhenKeyAbsent', () async {
    final service = GeminiService(
      const FlutterSecureStorage(),
      client: _FakeGeminiClient(_fullSpecResponse()),
    );

    expect(
      () => service.generateSpec(rawIdea: 'Idea', questionnaireJson: '{}'),
      throwsA(isA<GeminiMissingKeyException>()),
    );
  });
}

class _FakeGeminiClient implements GeminiTextClient {
  const _FakeGeminiClient(this.response);

  final String response;

  @override
  Future<String?> generateText({
    required String apiKey,
    required String prompt,
  }) async {
    return response;
  }
}

String _fullSpecResponse({bool markdown = false}) {
  const json = '''
{
  "overview": {},
  "features": {},
  "techStack": {},
  "architecture": {},
  "databaseDesign": {},
  "apiDesign": {},
  "developmentPhases": [],
  "risks": [],
  "complexityAssessment": {}
}
''';
  return markdown ? '```json\n$json\n```' : json;
}
