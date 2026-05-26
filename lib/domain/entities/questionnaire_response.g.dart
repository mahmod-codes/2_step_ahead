// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionnaireResponse _$QuestionnaireResponseFromJson(
  Map<String, dynamic> json,
) => _QuestionnaireResponse(
  id: (json['id'] as num).toInt(),
  projectId: (json['projectId'] as num).toInt(),
  answersJson: json['answersJson'] as String,
  updatedAt: (json['updatedAt'] as num).toInt(),
);

Map<String, dynamic> _$QuestionnaireResponseToJson(
  _QuestionnaireResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'projectId': instance.projectId,
  'answersJson': instance.answersJson,
  'updatedAt': instance.updatedAt,
};
