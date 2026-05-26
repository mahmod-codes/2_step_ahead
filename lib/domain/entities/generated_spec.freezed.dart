// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generated_spec.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneratedSpec {

 int get id; int get projectId; int get version; String get contentJson; int get createdAt;
/// Create a copy of GeneratedSpec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratedSpecCopyWith<GeneratedSpec> get copyWith => _$GeneratedSpecCopyWithImpl<GeneratedSpec>(this as GeneratedSpec, _$identity);

  /// Serializes this GeneratedSpec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratedSpec&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.version, version) || other.version == version)&&(identical(other.contentJson, contentJson) || other.contentJson == contentJson)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,version,contentJson,createdAt);

@override
String toString() {
  return 'GeneratedSpec(id: $id, projectId: $projectId, version: $version, contentJson: $contentJson, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $GeneratedSpecCopyWith<$Res>  {
  factory $GeneratedSpecCopyWith(GeneratedSpec value, $Res Function(GeneratedSpec) _then) = _$GeneratedSpecCopyWithImpl;
@useResult
$Res call({
 int id, int projectId, int version, String contentJson, int createdAt
});




}
/// @nodoc
class _$GeneratedSpecCopyWithImpl<$Res>
    implements $GeneratedSpecCopyWith<$Res> {
  _$GeneratedSpecCopyWithImpl(this._self, this._then);

  final GeneratedSpec _self;
  final $Res Function(GeneratedSpec) _then;

/// Create a copy of GeneratedSpec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? version = null,Object? contentJson = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,contentJson: null == contentJson ? _self.contentJson : contentJson // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneratedSpec].
extension GeneratedSpecPatterns on GeneratedSpec {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneratedSpec value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneratedSpec() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneratedSpec value)  $default,){
final _that = this;
switch (_that) {
case _GeneratedSpec():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneratedSpec value)?  $default,){
final _that = this;
switch (_that) {
case _GeneratedSpec() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int projectId,  int version,  String contentJson,  int createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneratedSpec() when $default != null:
return $default(_that.id,_that.projectId,_that.version,_that.contentJson,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int projectId,  int version,  String contentJson,  int createdAt)  $default,) {final _that = this;
switch (_that) {
case _GeneratedSpec():
return $default(_that.id,_that.projectId,_that.version,_that.contentJson,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int projectId,  int version,  String contentJson,  int createdAt)?  $default,) {final _that = this;
switch (_that) {
case _GeneratedSpec() when $default != null:
return $default(_that.id,_that.projectId,_that.version,_that.contentJson,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneratedSpec implements GeneratedSpec {
  const _GeneratedSpec({required this.id, required this.projectId, required this.version, required this.contentJson, required this.createdAt});
  factory _GeneratedSpec.fromJson(Map<String, dynamic> json) => _$GeneratedSpecFromJson(json);

@override final  int id;
@override final  int projectId;
@override final  int version;
@override final  String contentJson;
@override final  int createdAt;

/// Create a copy of GeneratedSpec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratedSpecCopyWith<_GeneratedSpec> get copyWith => __$GeneratedSpecCopyWithImpl<_GeneratedSpec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratedSpecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratedSpec&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.version, version) || other.version == version)&&(identical(other.contentJson, contentJson) || other.contentJson == contentJson)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,version,contentJson,createdAt);

@override
String toString() {
  return 'GeneratedSpec(id: $id, projectId: $projectId, version: $version, contentJson: $contentJson, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$GeneratedSpecCopyWith<$Res> implements $GeneratedSpecCopyWith<$Res> {
  factory _$GeneratedSpecCopyWith(_GeneratedSpec value, $Res Function(_GeneratedSpec) _then) = __$GeneratedSpecCopyWithImpl;
@override @useResult
$Res call({
 int id, int projectId, int version, String contentJson, int createdAt
});




}
/// @nodoc
class __$GeneratedSpecCopyWithImpl<$Res>
    implements _$GeneratedSpecCopyWith<$Res> {
  __$GeneratedSpecCopyWithImpl(this._self, this._then);

  final _GeneratedSpec _self;
  final $Res Function(_GeneratedSpec) _then;

/// Create a copy of GeneratedSpec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? version = null,Object? contentJson = null,Object? createdAt = null,}) {
  return _then(_GeneratedSpec(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,contentJson: null == contentJson ? _self.contentJson : contentJson // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
