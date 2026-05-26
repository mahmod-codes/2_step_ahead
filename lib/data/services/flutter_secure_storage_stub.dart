class FlutterSecureStorage {
  const FlutterSecureStorage();

  static final Map<String, String> _values = <String, String>{};

  static void setMockInitialValues(Map<String, String> values) {
    _values
      ..clear()
      ..addAll(values);
  }

  Future<String?> read({required String key}) async {
    return _values[key];
  }

  Future<void> write({required String key, required String value}) async {
    _values[key] = value;
  }
}
