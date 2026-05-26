import 'dart:convert';

const requiredSpecFields = {
  'overview',
  'features',
  'techStack',
  'architecture',
  'databaseDesign',
  'apiDesign',
  'developmentPhases',
  'risks',
  'complexityAssessment',
};

String stripMarkdownCodeFence(String value) {
  var output = value.trim();
  if (output.startsWith('```json')) {
    output = output.substring(7).trim();
  } else if (output.startsWith('```')) {
    output = output.substring(3).trim();
  }
  if (output.endsWith('```')) {
    output = output.substring(0, output.length - 3).trim();
  }
  return output;
}

Map<String, dynamic> parseSpecJson(String value) {
  final stripped = stripMarkdownCodeFence(value);
  final decoded = jsonDecode(stripped);
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('Expected JSON object.');
  }
  return decoded;
}

bool hasRequiredSpecFields(Map<String, dynamic> value) {
  return requiredSpecFields.every(value.containsKey);
}

String prettyJson(String value) {
  final decoded = jsonDecode(value);
  return const JsonEncoder.withIndent('  ').convert(decoded);
}
