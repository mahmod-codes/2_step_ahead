// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_spec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneratedSpec _$GeneratedSpecFromJson(Map<String, dynamic> json) =>
    _GeneratedSpec(
      id: (json['id'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      version: (json['version'] as num).toInt(),
      contentJson: json['contentJson'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
    );

Map<String, dynamic> _$GeneratedSpecToJson(_GeneratedSpec instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'version': instance.version,
      'contentJson': instance.contentJson,
      'createdAt': instance.createdAt,
    };
