// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BadgeModel {

 String get id; String get name; String get description; String get icon; String get color; bool get isUnlocked; DateTime? get unlockedAt;
/// Create a copy of BadgeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadgeModelCopyWith<BadgeModel> get copyWith => _$BadgeModelCopyWithImpl<BadgeModel>(this as BadgeModel, _$identity);

  /// Serializes this BadgeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadgeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,icon,color,isUnlocked,unlockedAt);

@override
String toString() {
  return 'BadgeModel(id: $id, name: $name, description: $description, icon: $icon, color: $color, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt)';
}


}

/// @nodoc
abstract mixin class $BadgeModelCopyWith<$Res>  {
  factory $BadgeModelCopyWith(BadgeModel value, $Res Function(BadgeModel) _then) = _$BadgeModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String icon, String color, bool isUnlocked, DateTime? unlockedAt
});




}
/// @nodoc
class _$BadgeModelCopyWithImpl<$Res>
    implements $BadgeModelCopyWith<$Res> {
  _$BadgeModelCopyWithImpl(this._self, this._then);

  final BadgeModel _self;
  final $Res Function(BadgeModel) _then;

/// Create a copy of BadgeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? icon = null,Object? color = null,Object? isUnlocked = null,Object? unlockedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BadgeModel].
extension BadgeModelPatterns on BadgeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BadgeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BadgeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BadgeModel value)  $default,){
final _that = this;
switch (_that) {
case _BadgeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BadgeModel value)?  $default,){
final _that = this;
switch (_that) {
case _BadgeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String icon,  String color,  bool isUnlocked,  DateTime? unlockedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BadgeModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.icon,_that.color,_that.isUnlocked,_that.unlockedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String icon,  String color,  bool isUnlocked,  DateTime? unlockedAt)  $default,) {final _that = this;
switch (_that) {
case _BadgeModel():
return $default(_that.id,_that.name,_that.description,_that.icon,_that.color,_that.isUnlocked,_that.unlockedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String icon,  String color,  bool isUnlocked,  DateTime? unlockedAt)?  $default,) {final _that = this;
switch (_that) {
case _BadgeModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.icon,_that.color,_that.isUnlocked,_that.unlockedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BadgeModel implements BadgeModel {
  const _BadgeModel({required this.id, required this.name, required this.description, required this.icon, required this.color, required this.isUnlocked, this.unlockedAt});
  factory _BadgeModel.fromJson(Map<String, dynamic> json) => _$BadgeModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String icon;
@override final  String color;
@override final  bool isUnlocked;
@override final  DateTime? unlockedAt;

/// Create a copy of BadgeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadgeModelCopyWith<_BadgeModel> get copyWith => __$BadgeModelCopyWithImpl<_BadgeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BadgeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadgeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color)&&(identical(other.isUnlocked, isUnlocked) || other.isUnlocked == isUnlocked)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,icon,color,isUnlocked,unlockedAt);

@override
String toString() {
  return 'BadgeModel(id: $id, name: $name, description: $description, icon: $icon, color: $color, isUnlocked: $isUnlocked, unlockedAt: $unlockedAt)';
}


}

/// @nodoc
abstract mixin class _$BadgeModelCopyWith<$Res> implements $BadgeModelCopyWith<$Res> {
  factory _$BadgeModelCopyWith(_BadgeModel value, $Res Function(_BadgeModel) _then) = __$BadgeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String icon, String color, bool isUnlocked, DateTime? unlockedAt
});




}
/// @nodoc
class __$BadgeModelCopyWithImpl<$Res>
    implements _$BadgeModelCopyWith<$Res> {
  __$BadgeModelCopyWithImpl(this._self, this._then);

  final _BadgeModel _self;
  final $Res Function(_BadgeModel) _then;

/// Create a copy of BadgeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? icon = null,Object? color = null,Object? isUnlocked = null,Object? unlockedAt = freezed,}) {
  return _then(_BadgeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,isUnlocked: null == isUnlocked ? _self.isUnlocked : isUnlocked // ignore: cast_nullable_to_non_nullable
as bool,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
