// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyService {

 String get name; String? get type; double get rating; String get tags; String get address;
/// Create a copy of NearbyService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyServiceCopyWith<NearbyService> get copyWith => _$NearbyServiceCopyWithImpl<NearbyService>(this as NearbyService, _$identity);

  /// Serializes this NearbyService to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyService&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.tags, tags) || other.tags == tags)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,rating,tags,address);

@override
String toString() {
  return 'NearbyService(name: $name, type: $type, rating: $rating, tags: $tags, address: $address)';
}


}

/// @nodoc
abstract mixin class $NearbyServiceCopyWith<$Res>  {
  factory $NearbyServiceCopyWith(NearbyService value, $Res Function(NearbyService) _then) = _$NearbyServiceCopyWithImpl;
@useResult
$Res call({
 String name, String? type, double rating, String tags, String address
});




}
/// @nodoc
class _$NearbyServiceCopyWithImpl<$Res>
    implements $NearbyServiceCopyWith<$Res> {
  _$NearbyServiceCopyWithImpl(this._self, this._then);

  final NearbyService _self;
  final $Res Function(NearbyService) _then;

/// Create a copy of NearbyService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? type = freezed,Object? rating = null,Object? tags = null,Object? address = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NearbyService].
extension NearbyServicePatterns on NearbyService {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyService value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyService() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyService value)  $default,){
final _that = this;
switch (_that) {
case _NearbyService():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyService value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyService() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? type,  double rating,  String tags,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyService() when $default != null:
return $default(_that.name,_that.type,_that.rating,_that.tags,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? type,  double rating,  String tags,  String address)  $default,) {final _that = this;
switch (_that) {
case _NearbyService():
return $default(_that.name,_that.type,_that.rating,_that.tags,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? type,  double rating,  String tags,  String address)?  $default,) {final _that = this;
switch (_that) {
case _NearbyService() when $default != null:
return $default(_that.name,_that.type,_that.rating,_that.tags,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearbyService implements NearbyService {
  const _NearbyService({required this.name, this.type, this.rating = 0.0, this.tags = '', this.address = ''});
  factory _NearbyService.fromJson(Map<String, dynamic> json) => _$NearbyServiceFromJson(json);

@override final  String name;
@override final  String? type;
@override@JsonKey() final  double rating;
@override@JsonKey() final  String tags;
@override@JsonKey() final  String address;

/// Create a copy of NearbyService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyServiceCopyWith<_NearbyService> get copyWith => __$NearbyServiceCopyWithImpl<_NearbyService>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyServiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyService&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.tags, tags) || other.tags == tags)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,type,rating,tags,address);

@override
String toString() {
  return 'NearbyService(name: $name, type: $type, rating: $rating, tags: $tags, address: $address)';
}


}

/// @nodoc
abstract mixin class _$NearbyServiceCopyWith<$Res> implements $NearbyServiceCopyWith<$Res> {
  factory _$NearbyServiceCopyWith(_NearbyService value, $Res Function(_NearbyService) _then) = __$NearbyServiceCopyWithImpl;
@override @useResult
$Res call({
 String name, String? type, double rating, String tags, String address
});




}
/// @nodoc
class __$NearbyServiceCopyWithImpl<$Res>
    implements _$NearbyServiceCopyWith<$Res> {
  __$NearbyServiceCopyWithImpl(this._self, this._then);

  final _NearbyService _self;
  final $Res Function(_NearbyService) _then;

/// Create a copy of NearbyService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? type = freezed,Object? rating = null,Object? tags = null,Object? address = null,}) {
  return _then(_NearbyService(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
