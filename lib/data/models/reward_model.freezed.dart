// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RewardModel {

 String get id; String get partnerName; String get title; String get description; int get pointsRequired; String? get imageUrl;
/// Create a copy of RewardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardModelCopyWith<RewardModel> get copyWith => _$RewardModelCopyWithImpl<RewardModel>(this as RewardModel, _$identity);

  /// Serializes this RewardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RewardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.partnerName, partnerName) || other.partnerName == partnerName)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.pointsRequired, pointsRequired) || other.pointsRequired == pointsRequired)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,partnerName,title,description,pointsRequired,imageUrl);

@override
String toString() {
  return 'RewardModel(id: $id, partnerName: $partnerName, title: $title, description: $description, pointsRequired: $pointsRequired, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $RewardModelCopyWith<$Res>  {
  factory $RewardModelCopyWith(RewardModel value, $Res Function(RewardModel) _then) = _$RewardModelCopyWithImpl;
@useResult
$Res call({
 String id, String partnerName, String title, String description, int pointsRequired, String? imageUrl
});




}
/// @nodoc
class _$RewardModelCopyWithImpl<$Res>
    implements $RewardModelCopyWith<$Res> {
  _$RewardModelCopyWithImpl(this._self, this._then);

  final RewardModel _self;
  final $Res Function(RewardModel) _then;

/// Create a copy of RewardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? partnerName = null,Object? title = null,Object? description = null,Object? pointsRequired = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partnerName: null == partnerName ? _self.partnerName : partnerName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pointsRequired: null == pointsRequired ? _self.pointsRequired : pointsRequired // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RewardModel].
extension RewardModelPatterns on RewardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RewardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RewardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RewardModel value)  $default,){
final _that = this;
switch (_that) {
case _RewardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RewardModel value)?  $default,){
final _that = this;
switch (_that) {
case _RewardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String partnerName,  String title,  String description,  int pointsRequired,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RewardModel() when $default != null:
return $default(_that.id,_that.partnerName,_that.title,_that.description,_that.pointsRequired,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String partnerName,  String title,  String description,  int pointsRequired,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _RewardModel():
return $default(_that.id,_that.partnerName,_that.title,_that.description,_that.pointsRequired,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String partnerName,  String title,  String description,  int pointsRequired,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _RewardModel() when $default != null:
return $default(_that.id,_that.partnerName,_that.title,_that.description,_that.pointsRequired,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RewardModel implements RewardModel {
  const _RewardModel({required this.id, required this.partnerName, required this.title, required this.description, required this.pointsRequired, this.imageUrl});
  factory _RewardModel.fromJson(Map<String, dynamic> json) => _$RewardModelFromJson(json);

@override final  String id;
@override final  String partnerName;
@override final  String title;
@override final  String description;
@override final  int pointsRequired;
@override final  String? imageUrl;

/// Create a copy of RewardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardModelCopyWith<_RewardModel> get copyWith => __$RewardModelCopyWithImpl<_RewardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RewardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.partnerName, partnerName) || other.partnerName == partnerName)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.pointsRequired, pointsRequired) || other.pointsRequired == pointsRequired)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,partnerName,title,description,pointsRequired,imageUrl);

@override
String toString() {
  return 'RewardModel(id: $id, partnerName: $partnerName, title: $title, description: $description, pointsRequired: $pointsRequired, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$RewardModelCopyWith<$Res> implements $RewardModelCopyWith<$Res> {
  factory _$RewardModelCopyWith(_RewardModel value, $Res Function(_RewardModel) _then) = __$RewardModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String partnerName, String title, String description, int pointsRequired, String? imageUrl
});




}
/// @nodoc
class __$RewardModelCopyWithImpl<$Res>
    implements _$RewardModelCopyWith<$Res> {
  __$RewardModelCopyWithImpl(this._self, this._then);

  final _RewardModel _self;
  final $Res Function(_RewardModel) _then;

/// Create a copy of RewardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? partnerName = null,Object? title = null,Object? description = null,Object? pointsRequired = null,Object? imageUrl = freezed,}) {
  return _then(_RewardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,partnerName: null == partnerName ? _self.partnerName : partnerName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,pointsRequired: null == pointsRequired ? _self.pointsRequired : pointsRequired // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
