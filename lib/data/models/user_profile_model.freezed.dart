// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileModel {

 String get id; String get email; String get fullName; String? get avatarUrl; String get role;@JsonKey(readValue: _readTotalPoints) int get totalPoints;@JsonKey(readValue: _readRecycleCount) int get recycleCount;@JsonKey(readValue: _readLevel) int get level;@JsonKey(readValue: _readTotalEarnings) double get totalEarnings;@JsonKey(readValue: _readRepairedCount) int get repairedCount;@JsonKey(readValue: _readPreventedWasteKg) double get preventedWasteKg;@JsonKey(readValue: _readCo2Saved) String get co2Saved; int get rank; double get averageRating; int get reviewCount;
/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<UserProfileModel> get copyWith => _$UserProfileModelCopyWithImpl<UserProfileModel>(this as UserProfileModel, _$identity);

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.role, role) || other.role == role)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.recycleCount, recycleCount) || other.recycleCount == recycleCount)&&(identical(other.level, level) || other.level == level)&&(identical(other.totalEarnings, totalEarnings) || other.totalEarnings == totalEarnings)&&(identical(other.repairedCount, repairedCount) || other.repairedCount == repairedCount)&&(identical(other.preventedWasteKg, preventedWasteKg) || other.preventedWasteKg == preventedWasteKg)&&(identical(other.co2Saved, co2Saved) || other.co2Saved == co2Saved)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,avatarUrl,role,totalPoints,recycleCount,level,totalEarnings,repairedCount,preventedWasteKg,co2Saved,rank,averageRating,reviewCount);

@override
String toString() {
  return 'UserProfileModel(id: $id, email: $email, fullName: $fullName, avatarUrl: $avatarUrl, role: $role, totalPoints: $totalPoints, recycleCount: $recycleCount, level: $level, totalEarnings: $totalEarnings, repairedCount: $repairedCount, preventedWasteKg: $preventedWasteKg, co2Saved: $co2Saved, rank: $rank, averageRating: $averageRating, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class $UserProfileModelCopyWith<$Res>  {
  factory $UserProfileModelCopyWith(UserProfileModel value, $Res Function(UserProfileModel) _then) = _$UserProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, String fullName, String? avatarUrl, String role,@JsonKey(readValue: _readTotalPoints) int totalPoints,@JsonKey(readValue: _readRecycleCount) int recycleCount,@JsonKey(readValue: _readLevel) int level,@JsonKey(readValue: _readTotalEarnings) double totalEarnings,@JsonKey(readValue: _readRepairedCount) int repairedCount,@JsonKey(readValue: _readPreventedWasteKg) double preventedWasteKg,@JsonKey(readValue: _readCo2Saved) String co2Saved, int rank, double averageRating, int reviewCount
});




}
/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._self, this._then);

  final UserProfileModel _self;
  final $Res Function(UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? avatarUrl = freezed,Object? role = null,Object? totalPoints = null,Object? recycleCount = null,Object? level = null,Object? totalEarnings = null,Object? repairedCount = null,Object? preventedWasteKg = null,Object? co2Saved = null,Object? rank = null,Object? averageRating = null,Object? reviewCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,recycleCount: null == recycleCount ? _self.recycleCount : recycleCount // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,totalEarnings: null == totalEarnings ? _self.totalEarnings : totalEarnings // ignore: cast_nullable_to_non_nullable
as double,repairedCount: null == repairedCount ? _self.repairedCount : repairedCount // ignore: cast_nullable_to_non_nullable
as int,preventedWasteKg: null == preventedWasteKg ? _self.preventedWasteKg : preventedWasteKg // ignore: cast_nullable_to_non_nullable
as double,co2Saved: null == co2Saved ? _self.co2Saved : co2Saved // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileModel].
extension UserProfileModelPatterns on UserProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String fullName,  String? avatarUrl,  String role, @JsonKey(readValue: _readTotalPoints)  int totalPoints, @JsonKey(readValue: _readRecycleCount)  int recycleCount, @JsonKey(readValue: _readLevel)  int level, @JsonKey(readValue: _readTotalEarnings)  double totalEarnings, @JsonKey(readValue: _readRepairedCount)  int repairedCount, @JsonKey(readValue: _readPreventedWasteKg)  double preventedWasteKg, @JsonKey(readValue: _readCo2Saved)  String co2Saved,  int rank,  double averageRating,  int reviewCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.avatarUrl,_that.role,_that.totalPoints,_that.recycleCount,_that.level,_that.totalEarnings,_that.repairedCount,_that.preventedWasteKg,_that.co2Saved,_that.rank,_that.averageRating,_that.reviewCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String fullName,  String? avatarUrl,  String role, @JsonKey(readValue: _readTotalPoints)  int totalPoints, @JsonKey(readValue: _readRecycleCount)  int recycleCount, @JsonKey(readValue: _readLevel)  int level, @JsonKey(readValue: _readTotalEarnings)  double totalEarnings, @JsonKey(readValue: _readRepairedCount)  int repairedCount, @JsonKey(readValue: _readPreventedWasteKg)  double preventedWasteKg, @JsonKey(readValue: _readCo2Saved)  String co2Saved,  int rank,  double averageRating,  int reviewCount)  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel():
return $default(_that.id,_that.email,_that.fullName,_that.avatarUrl,_that.role,_that.totalPoints,_that.recycleCount,_that.level,_that.totalEarnings,_that.repairedCount,_that.preventedWasteKg,_that.co2Saved,_that.rank,_that.averageRating,_that.reviewCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String fullName,  String? avatarUrl,  String role, @JsonKey(readValue: _readTotalPoints)  int totalPoints, @JsonKey(readValue: _readRecycleCount)  int recycleCount, @JsonKey(readValue: _readLevel)  int level, @JsonKey(readValue: _readTotalEarnings)  double totalEarnings, @JsonKey(readValue: _readRepairedCount)  int repairedCount, @JsonKey(readValue: _readPreventedWasteKg)  double preventedWasteKg, @JsonKey(readValue: _readCo2Saved)  String co2Saved,  int rank,  double averageRating,  int reviewCount)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.id,_that.email,_that.fullName,_that.avatarUrl,_that.role,_that.totalPoints,_that.recycleCount,_that.level,_that.totalEarnings,_that.repairedCount,_that.preventedWasteKg,_that.co2Saved,_that.rank,_that.averageRating,_that.reviewCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileModel implements UserProfileModel {
  const _UserProfileModel({required this.id, required this.email, required this.fullName, this.avatarUrl, this.role = 'user', @JsonKey(readValue: _readTotalPoints) this.totalPoints = 0, @JsonKey(readValue: _readRecycleCount) this.recycleCount = 0, @JsonKey(readValue: _readLevel) this.level = 1, @JsonKey(readValue: _readTotalEarnings) this.totalEarnings = 0.0, @JsonKey(readValue: _readRepairedCount) this.repairedCount = 0, @JsonKey(readValue: _readPreventedWasteKg) this.preventedWasteKg = 0.0, @JsonKey(readValue: _readCo2Saved) this.co2Saved = '0.0', this.rank = 0, this.averageRating = 0.0, this.reviewCount = 0});
  factory _UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);

@override final  String id;
@override final  String email;
@override final  String fullName;
@override final  String? avatarUrl;
@override@JsonKey() final  String role;
@override@JsonKey(readValue: _readTotalPoints) final  int totalPoints;
@override@JsonKey(readValue: _readRecycleCount) final  int recycleCount;
@override@JsonKey(readValue: _readLevel) final  int level;
@override@JsonKey(readValue: _readTotalEarnings) final  double totalEarnings;
@override@JsonKey(readValue: _readRepairedCount) final  int repairedCount;
@override@JsonKey(readValue: _readPreventedWasteKg) final  double preventedWasteKg;
@override@JsonKey(readValue: _readCo2Saved) final  String co2Saved;
@override@JsonKey() final  int rank;
@override@JsonKey() final  double averageRating;
@override@JsonKey() final  int reviewCount;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileModelCopyWith<_UserProfileModel> get copyWith => __$UserProfileModelCopyWithImpl<_UserProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.role, role) || other.role == role)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.recycleCount, recycleCount) || other.recycleCount == recycleCount)&&(identical(other.level, level) || other.level == level)&&(identical(other.totalEarnings, totalEarnings) || other.totalEarnings == totalEarnings)&&(identical(other.repairedCount, repairedCount) || other.repairedCount == repairedCount)&&(identical(other.preventedWasteKg, preventedWasteKg) || other.preventedWasteKg == preventedWasteKg)&&(identical(other.co2Saved, co2Saved) || other.co2Saved == co2Saved)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,fullName,avatarUrl,role,totalPoints,recycleCount,level,totalEarnings,repairedCount,preventedWasteKg,co2Saved,rank,averageRating,reviewCount);

@override
String toString() {
  return 'UserProfileModel(id: $id, email: $email, fullName: $fullName, avatarUrl: $avatarUrl, role: $role, totalPoints: $totalPoints, recycleCount: $recycleCount, level: $level, totalEarnings: $totalEarnings, repairedCount: $repairedCount, preventedWasteKg: $preventedWasteKg, co2Saved: $co2Saved, rank: $rank, averageRating: $averageRating, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class _$UserProfileModelCopyWith<$Res> implements $UserProfileModelCopyWith<$Res> {
  factory _$UserProfileModelCopyWith(_UserProfileModel value, $Res Function(_UserProfileModel) _then) = __$UserProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String fullName, String? avatarUrl, String role,@JsonKey(readValue: _readTotalPoints) int totalPoints,@JsonKey(readValue: _readRecycleCount) int recycleCount,@JsonKey(readValue: _readLevel) int level,@JsonKey(readValue: _readTotalEarnings) double totalEarnings,@JsonKey(readValue: _readRepairedCount) int repairedCount,@JsonKey(readValue: _readPreventedWasteKg) double preventedWasteKg,@JsonKey(readValue: _readCo2Saved) String co2Saved, int rank, double averageRating, int reviewCount
});




}
/// @nodoc
class __$UserProfileModelCopyWithImpl<$Res>
    implements _$UserProfileModelCopyWith<$Res> {
  __$UserProfileModelCopyWithImpl(this._self, this._then);

  final _UserProfileModel _self;
  final $Res Function(_UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? fullName = null,Object? avatarUrl = freezed,Object? role = null,Object? totalPoints = null,Object? recycleCount = null,Object? level = null,Object? totalEarnings = null,Object? repairedCount = null,Object? preventedWasteKg = null,Object? co2Saved = null,Object? rank = null,Object? averageRating = null,Object? reviewCount = null,}) {
  return _then(_UserProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,recycleCount: null == recycleCount ? _self.recycleCount : recycleCount // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,totalEarnings: null == totalEarnings ? _self.totalEarnings : totalEarnings // ignore: cast_nullable_to_non_nullable
as double,repairedCount: null == repairedCount ? _self.repairedCount : repairedCount // ignore: cast_nullable_to_non_nullable
as int,preventedWasteKg: null == preventedWasteKg ? _self.preventedWasteKg : preventedWasteKg // ignore: cast_nullable_to_non_nullable
as double,co2Saved: null == co2Saved ? _self.co2Saved : co2Saved // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
