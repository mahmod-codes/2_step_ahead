// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: (json['id'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
  title: json['title'] as String,
  rawIdea: json['rawIdea'] as String?,
  status: json['status'] as String,
  createdAt: (json['createdAt'] as num).toInt(),
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'title': instance.title,
  'rawIdea': instance.rawIdea,
  'status': instance.status,
  'createdAt': instance.createdAt,
};
