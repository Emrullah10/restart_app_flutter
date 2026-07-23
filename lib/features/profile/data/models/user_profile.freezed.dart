// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get fullName; String get role; int get totalPoints; int get recycleCount; String get co2Saved; int get repairedCount; double get preventedWasteKg; double get totalEarnings; int get level;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.recycleCount, recycleCount) || other.recycleCount == recycleCount)&&(identical(other.co2Saved, co2Saved) || other.co2Saved == co2Saved)&&(identical(other.repairedCount, repairedCount) || other.repairedCount == repairedCount)&&(identical(other.preventedWasteKg, preventedWasteKg) || other.preventedWasteKg == preventedWasteKg)&&(identical(other.totalEarnings, totalEarnings) || other.totalEarnings == totalEarnings)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,role,totalPoints,recycleCount,co2Saved,repairedCount,preventedWasteKg,totalEarnings,level);

@override
String toString() {
  return 'UserProfile(fullName: $fullName, role: $role, totalPoints: $totalPoints, recycleCount: $recycleCount, co2Saved: $co2Saved, repairedCount: $repairedCount, preventedWasteKg: $preventedWasteKg, totalEarnings: $totalEarnings, level: $level)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String fullName, String role, int totalPoints, int recycleCount, String co2Saved, int repairedCount, double preventedWasteKg, double totalEarnings, int level
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? role = null,Object? totalPoints = null,Object? recycleCount = null,Object? co2Saved = null,Object? repairedCount = null,Object? preventedWasteKg = null,Object? totalEarnings = null,Object? level = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,recycleCount: null == recycleCount ? _self.recycleCount : recycleCount // ignore: cast_nullable_to_non_nullable
as int,co2Saved: null == co2Saved ? _self.co2Saved : co2Saved // ignore: cast_nullable_to_non_nullable
as String,repairedCount: null == repairedCount ? _self.repairedCount : repairedCount // ignore: cast_nullable_to_non_nullable
as int,preventedWasteKg: null == preventedWasteKg ? _self.preventedWasteKg : preventedWasteKg // ignore: cast_nullable_to_non_nullable
as double,totalEarnings: null == totalEarnings ? _self.totalEarnings : totalEarnings // ignore: cast_nullable_to_non_nullable
as double,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String role,  int totalPoints,  int recycleCount,  String co2Saved,  int repairedCount,  double preventedWasteKg,  double totalEarnings,  int level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.fullName,_that.role,_that.totalPoints,_that.recycleCount,_that.co2Saved,_that.repairedCount,_that.preventedWasteKg,_that.totalEarnings,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String role,  int totalPoints,  int recycleCount,  String co2Saved,  int repairedCount,  double preventedWasteKg,  double totalEarnings,  int level)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.fullName,_that.role,_that.totalPoints,_that.recycleCount,_that.co2Saved,_that.repairedCount,_that.preventedWasteKg,_that.totalEarnings,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String role,  int totalPoints,  int recycleCount,  String co2Saved,  int repairedCount,  double preventedWasteKg,  double totalEarnings,  int level)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.fullName,_that.role,_that.totalPoints,_that.recycleCount,_that.co2Saved,_that.repairedCount,_that.preventedWasteKg,_that.totalEarnings,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.fullName, this.role = 'Member', this.totalPoints = 0, this.recycleCount = 0, this.co2Saved = '0.0', this.repairedCount = 0, this.preventedWasteKg = 0.0, this.totalEarnings = 0.0, this.level = 1});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String fullName;
@override@JsonKey() final  String role;
@override@JsonKey() final  int totalPoints;
@override@JsonKey() final  int recycleCount;
@override@JsonKey() final  String co2Saved;
@override@JsonKey() final  int repairedCount;
@override@JsonKey() final  double preventedWasteKg;
@override@JsonKey() final  double totalEarnings;
@override@JsonKey() final  int level;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.role, role) || other.role == role)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.recycleCount, recycleCount) || other.recycleCount == recycleCount)&&(identical(other.co2Saved, co2Saved) || other.co2Saved == co2Saved)&&(identical(other.repairedCount, repairedCount) || other.repairedCount == repairedCount)&&(identical(other.preventedWasteKg, preventedWasteKg) || other.preventedWasteKg == preventedWasteKg)&&(identical(other.totalEarnings, totalEarnings) || other.totalEarnings == totalEarnings)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,role,totalPoints,recycleCount,co2Saved,repairedCount,preventedWasteKg,totalEarnings,level);

@override
String toString() {
  return 'UserProfile(fullName: $fullName, role: $role, totalPoints: $totalPoints, recycleCount: $recycleCount, co2Saved: $co2Saved, repairedCount: $repairedCount, preventedWasteKg: $preventedWasteKg, totalEarnings: $totalEarnings, level: $level)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String role, int totalPoints, int recycleCount, String co2Saved, int repairedCount, double preventedWasteKg, double totalEarnings, int level
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? role = null,Object? totalPoints = null,Object? recycleCount = null,Object? co2Saved = null,Object? repairedCount = null,Object? preventedWasteKg = null,Object? totalEarnings = null,Object? level = null,}) {
  return _then(_UserProfile(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,recycleCount: null == recycleCount ? _self.recycleCount : recycleCount // ignore: cast_nullable_to_non_nullable
as int,co2Saved: null == co2Saved ? _self.co2Saved : co2Saved // ignore: cast_nullable_to_non_nullable
as String,repairedCount: null == repairedCount ? _self.repairedCount : repairedCount // ignore: cast_nullable_to_non_nullable
as int,preventedWasteKg: null == preventedWasteKg ? _self.preventedWasteKg : preventedWasteKg // ignore: cast_nullable_to_non_nullable
as double,totalEarnings: null == totalEarnings ? _self.totalEarnings : totalEarnings // ignore: cast_nullable_to_non_nullable
as double,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
