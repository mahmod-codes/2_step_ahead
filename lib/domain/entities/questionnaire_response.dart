import 'package:freezed_annotation/freezed_annotation.dart';

part 'questionnaire_response.freezed.dart';
part 'questionnaire_response.g.dart';

@freezed
abstract class QuestionnaireResponse with _$QuestionnaireResponse {
  const factory QuestionnaireResponse({
    required int id,
    required int projectId,
    required String answersJson,
    required int updatedAt,
  }) = _QuestionnaireResponse;

  factory QuestionnaireResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireResponseFromJson(json);
}
