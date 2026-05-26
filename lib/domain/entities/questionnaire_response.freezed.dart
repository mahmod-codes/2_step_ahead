// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionnaire_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionnaireResponse {

 int get id; int get projectId; String get answersJson; int get updatedAt;
/// Create a copy of QuestionnaireResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionnaireResponseCopyWith<QuestionnaireResponse> get copyWith => _$QuestionnaireResponseCopyWithImpl<QuestionnaireResponse>(this as QuestionnaireResponse, _$identity);

  /// Serializes this QuestionnaireResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionnaireResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.answersJson, answersJson) || other.answersJson == answersJson)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,answersJson,updatedAt);

@override
String toString() {
  return 'QuestionnaireResponse(id: $id, projectId: $projectId, answersJson: $answersJson, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $QuestionnaireResponseCopyWith<$Res>  {
  factory $QuestionnaireResponseCopyWith(QuestionnaireResponse value, $Res Function(QuestionnaireResponse) _then) = _$QuestionnaireResponseCopyWithImpl;
@useResult
$Res call({
 int id, int projectId, String answersJson, int updatedAt
});




}
/// @nodoc
class _$QuestionnaireResponseCopyWithImpl<$Res>
    implements $QuestionnaireResponseCopyWith<$Res> {
  _$QuestionnaireResponseCopyWithImpl(this._self, this._then);

  final QuestionnaireResponse _self;
  final $Res Function(QuestionnaireResponse) _then;

/// Create a copy of QuestionnaireResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? answersJson = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,answersJson: null == answersJson ? _self.answersJson : answersJson // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionnaireResponse].
extension QuestionnaireResponsePatterns on QuestionnaireResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionnaireResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionnaireResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionnaireResponse value)  $default,){
final _that = this;
switch (_that) {
case _QuestionnaireResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionnaireResponse value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionnaireResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int projectId,  String answersJson,  int updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionnaireResponse() when $default != null:
return $default(_that.id,_that.projectId,_that.answersJson,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int projectId,  String answersJson,  int updatedAt)  $default,) {final _that = this;
switch (_that) {
case _QuestionnaireResponse():
return $default(_that.id,_that.projectId,_that.answersJson,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int projectId,  String answersJson,  int updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _QuestionnaireResponse() when $default != null:
return $default(_that.id,_that.projectId,_that.answersJson,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionnaireResponse implements QuestionnaireResponse {
  const _QuestionnaireResponse({required this.id, required this.projectId, required this.answersJson, required this.updatedAt});
  factory _QuestionnaireResponse.fromJson(Map<String, dynamic> json) => _$QuestionnaireResponseFromJson(json);

@override final  int id;
@override final  int projectId;
@override final  String answersJson;
@override final  int updatedAt;

/// Create a copy of QuestionnaireResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionnaireResponseCopyWith<_QuestionnaireResponse> get copyWith => __$QuestionnaireResponseCopyWithImpl<_QuestionnaireResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionnaireResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionnaireResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.answersJson, answersJson) || other.answersJson == answersJson)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,answersJson,updatedAt);

@override
String toString() {
  return 'QuestionnaireResponse(id: $id, projectId: $projectId, answersJson: $answersJson, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$QuestionnaireResponseCopyWith<$Res> implements $QuestionnaireResponseCopyWith<$Res> {
  factory _$QuestionnaireResponseCopyWith(_QuestionnaireResponse value, $Res Function(_QuestionnaireResponse) _then) = __$QuestionnaireResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, int projectId, String answersJson, int updatedAt
});




}
/// @nodoc
class __$QuestionnaireResponseCopyWithImpl<$Res>
    implements _$QuestionnaireResponseCopyWith<$Res> {
  __$QuestionnaireResponseCopyWithImpl(this._self, this._then);

  final _QuestionnaireResponse _self;
  final $Res Function(_QuestionnaireResponse) _then;

/// Create a copy of QuestionnaireResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? answersJson = null,Object? updatedAt = null,}) {
  return _then(_QuestionnaireResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int,answersJson: null == answersJson ? _self.answersJson : answersJson // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
