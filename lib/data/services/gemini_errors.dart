class GeminiMissingKeyException implements Exception {}

class GeminiNetworkException implements Exception {
  GeminiNetworkException(this.message);

  final String message;
}

class GeminiRateLimitException implements Exception {}

class GeminiInvalidJsonException implements Exception {}

class GeminiIncompleteSchemaException implements Exception {}
