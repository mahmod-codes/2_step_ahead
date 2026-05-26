import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated_spec.freezed.dart';
part 'generated_spec.g.dart';

@freezed
abstract class GeneratedSpec with _$GeneratedSpec {
  const factory GeneratedSpec({
    required int id,
    required int projectId,
    required int version,
    required String contentJson,
    required int createdAt,
  }) = _GeneratedSpec;

  factory GeneratedSpec.fromJson(Map<String, dynamic> json) =>
      _$GeneratedSpecFromJson(json);
}
