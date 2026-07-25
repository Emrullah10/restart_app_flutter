// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recycle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecycleState {

 bool get isLoading; String? get error; bool get isSuccess; TransportMode get selectedMode; double get estimatedPoints; String? get selectedCenterId; String? get selectedCenterName; String get wasteType; double get weightKg; int? get resultTotalPoints; double? get resultCommissionTl;
/// Create a copy of RecycleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecycleStateCopyWith<RecycleState> get copyWith => _$RecycleStateCopyWithImpl<RecycleState>(this as RecycleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecycleState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.selectedMode, selectedMode) || other.selectedMode == selectedMode)&&(identical(other.estimatedPoints, estimatedPoints) || other.estimatedPoints == estimatedPoints)&&(identical(other.selectedCenterId, selectedCenterId) || other.selectedCenterId == selectedCenterId)&&(identical(other.selectedCenterName, selectedCenterName) || other.selectedCenterName == selectedCenterName)&&(identical(other.wasteType, wasteType) || other.wasteType == wasteType)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.resultTotalPoints, resultTotalPoints) || other.resultTotalPoints == resultTotalPoints)&&(identical(other.resultCommissionTl, resultCommissionTl) || other.resultCommissionTl == resultCommissionTl));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,isSuccess,selectedMode,estimatedPoints,selectedCenterId,selectedCenterName,wasteType,weightKg,resultTotalPoints,resultCommissionTl);

@override
String toString() {
  return 'RecycleState(isLoading: $isLoading, error: $error, isSuccess: $isSuccess, selectedMode: $selectedMode, estimatedPoints: $estimatedPoints, selectedCenterId: $selectedCenterId, selectedCenterName: $selectedCenterName, wasteType: $wasteType, weightKg: $weightKg, resultTotalPoints: $resultTotalPoints, resultCommissionTl: $resultCommissionTl)';
}


}

/// @nodoc
abstract mixin class $RecycleStateCopyWith<$Res>  {
  factory $RecycleStateCopyWith(RecycleState value, $Res Function(RecycleState) _then) = _$RecycleStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, bool isSuccess, TransportMode selectedMode, double estimatedPoints, String? selectedCenterId, String? selectedCenterName, String wasteType, double weightKg, int? resultTotalPoints, double? resultCommissionTl
});




}
/// @nodoc
class _$RecycleStateCopyWithImpl<$Res>
    implements $RecycleStateCopyWith<$Res> {
  _$RecycleStateCopyWithImpl(this._self, this._then);

  final RecycleState _self;
  final $Res Function(RecycleState) _then;

/// Create a copy of RecycleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? isSuccess = null,Object? selectedMode = null,Object? estimatedPoints = null,Object? selectedCenterId = freezed,Object? selectedCenterName = freezed,Object? wasteType = null,Object? weightKg = null,Object? resultTotalPoints = freezed,Object? resultCommissionTl = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,selectedMode: null == selectedMode ? _self.selectedMode : selectedMode // ignore: cast_nullable_to_non_nullable
as TransportMode,estimatedPoints: null == estimatedPoints ? _self.estimatedPoints : estimatedPoints // ignore: cast_nullable_to_non_nullable
as double,selectedCenterId: freezed == selectedCenterId ? _self.selectedCenterId : selectedCenterId // ignore: cast_nullable_to_non_nullable
as String?,selectedCenterName: freezed == selectedCenterName ? _self.selectedCenterName : selectedCenterName // ignore: cast_nullable_to_non_nullable
as String?,wasteType: null == wasteType ? _self.wasteType : wasteType // ignore: cast_nullable_to_non_nullable
as String,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,resultTotalPoints: freezed == resultTotalPoints ? _self.resultTotalPoints : resultTotalPoints // ignore: cast_nullable_to_non_nullable
as int?,resultCommissionTl: freezed == resultCommissionTl ? _self.resultCommissionTl : resultCommissionTl // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecycleState].
extension RecycleStatePatterns on RecycleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecycleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecycleState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecycleState value)  $default,){
final _that = this;
switch (_that) {
case _RecycleState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecycleState value)?  $default,){
final _that = this;
switch (_that) {
case _RecycleState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  bool isSuccess,  TransportMode selectedMode,  double estimatedPoints,  String? selectedCenterId,  String? selectedCenterName,  String wasteType,  double weightKg,  int? resultTotalPoints,  double? resultCommissionTl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecycleState() when $default != null:
return $default(_that.isLoading,_that.error,_that.isSuccess,_that.selectedMode,_that.estimatedPoints,_that.selectedCenterId,_that.selectedCenterName,_that.wasteType,_that.weightKg,_that.resultTotalPoints,_that.resultCommissionTl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  bool isSuccess,  TransportMode selectedMode,  double estimatedPoints,  String? selectedCenterId,  String? selectedCenterName,  String wasteType,  double weightKg,  int? resultTotalPoints,  double? resultCommissionTl)  $default,) {final _that = this;
switch (_that) {
case _RecycleState():
return $default(_that.isLoading,_that.error,_that.isSuccess,_that.selectedMode,_that.estimatedPoints,_that.selectedCenterId,_that.selectedCenterName,_that.wasteType,_that.weightKg,_that.resultTotalPoints,_that.resultCommissionTl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  bool isSuccess,  TransportMode selectedMode,  double estimatedPoints,  String? selectedCenterId,  String? selectedCenterName,  String wasteType,  double weightKg,  int? resultTotalPoints,  double? resultCommissionTl)?  $default,) {final _that = this;
switch (_that) {
case _RecycleState() when $default != null:
return $default(_that.isLoading,_that.error,_that.isSuccess,_that.selectedMode,_that.estimatedPoints,_that.selectedCenterId,_that.selectedCenterName,_that.wasteType,_that.weightKg,_that.resultTotalPoints,_that.resultCommissionTl);case _:
  return null;

}
}

}

/// @nodoc


class _RecycleState implements RecycleState {
  const _RecycleState({this.isLoading = false, this.error, this.isSuccess = false, this.selectedMode = TransportMode.standard, this.estimatedPoints = 10.0, this.selectedCenterId, this.selectedCenterName, this.wasteType = 'electronic', this.weightKg = 1.0, this.resultTotalPoints, this.resultCommissionTl});
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  TransportMode selectedMode;
@override@JsonKey() final  double estimatedPoints;
@override final  String? selectedCenterId;
@override final  String? selectedCenterName;
@override@JsonKey() final  String wasteType;
@override@JsonKey() final  double weightKg;
@override final  int? resultTotalPoints;
@override final  double? resultCommissionTl;

/// Create a copy of RecycleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecycleStateCopyWith<_RecycleState> get copyWith => __$RecycleStateCopyWithImpl<_RecycleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecycleState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.selectedMode, selectedMode) || other.selectedMode == selectedMode)&&(identical(other.estimatedPoints, estimatedPoints) || other.estimatedPoints == estimatedPoints)&&(identical(other.selectedCenterId, selectedCenterId) || other.selectedCenterId == selectedCenterId)&&(identical(other.selectedCenterName, selectedCenterName) || other.selectedCenterName == selectedCenterName)&&(identical(other.wasteType, wasteType) || other.wasteType == wasteType)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.resultTotalPoints, resultTotalPoints) || other.resultTotalPoints == resultTotalPoints)&&(identical(other.resultCommissionTl, resultCommissionTl) || other.resultCommissionTl == resultCommissionTl));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,isSuccess,selectedMode,estimatedPoints,selectedCenterId,selectedCenterName,wasteType,weightKg,resultTotalPoints,resultCommissionTl);

@override
String toString() {
  return 'RecycleState(isLoading: $isLoading, error: $error, isSuccess: $isSuccess, selectedMode: $selectedMode, estimatedPoints: $estimatedPoints, selectedCenterId: $selectedCenterId, selectedCenterName: $selectedCenterName, wasteType: $wasteType, weightKg: $weightKg, resultTotalPoints: $resultTotalPoints, resultCommissionTl: $resultCommissionTl)';
}


}

/// @nodoc
abstract mixin class _$RecycleStateCopyWith<$Res> implements $RecycleStateCopyWith<$Res> {
  factory _$RecycleStateCopyWith(_RecycleState value, $Res Function(_RecycleState) _then) = __$RecycleStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, bool isSuccess, TransportMode selectedMode, double estimatedPoints, String? selectedCenterId, String? selectedCenterName, String wasteType, double weightKg, int? resultTotalPoints, double? resultCommissionTl
});




}
/// @nodoc
class __$RecycleStateCopyWithImpl<$Res>
    implements _$RecycleStateCopyWith<$Res> {
  __$RecycleStateCopyWithImpl(this._self, this._then);

  final _RecycleState _self;
  final $Res Function(_RecycleState) _then;

/// Create a copy of RecycleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? isSuccess = null,Object? selectedMode = null,Object? estimatedPoints = null,Object? selectedCenterId = freezed,Object? selectedCenterName = freezed,Object? wasteType = null,Object? weightKg = null,Object? resultTotalPoints = freezed,Object? resultCommissionTl = freezed,}) {
  return _then(_RecycleState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,selectedMode: null == selectedMode ? _self.selectedMode : selectedMode // ignore: cast_nullable_to_non_nullable
as TransportMode,estimatedPoints: null == estimatedPoints ? _self.estimatedPoints : estimatedPoints // ignore: cast_nullable_to_non_nullable
as double,selectedCenterId: freezed == selectedCenterId ? _self.selectedCenterId : selectedCenterId // ignore: cast_nullable_to_non_nullable
as String?,selectedCenterName: freezed == selectedCenterName ? _self.selectedCenterName : selectedCenterName // ignore: cast_nullable_to_non_nullable
as String?,wasteType: null == wasteType ? _self.wasteType : wasteType // ignore: cast_nullable_to_non_nullable
as String,weightKg: null == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double,resultTotalPoints: freezed == resultTotalPoints ? _self.resultTotalPoints : resultTotalPoints // ignore: cast_nullable_to_non_nullable
as int?,resultCommissionTl: freezed == resultCommissionTl ? _self.resultCommissionTl : resultCommissionTl // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
