// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MarketplaceProduct {

 String get title; String get subtitle; double get price; double get rating; String get location;
/// Create a copy of MarketplaceProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarketplaceProductCopyWith<MarketplaceProduct> get copyWith => _$MarketplaceProductCopyWithImpl<MarketplaceProduct>(this as MarketplaceProduct, _$identity);

  /// Serializes this MarketplaceProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarketplaceProduct&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,price,rating,location);

@override
String toString() {
  return 'MarketplaceProduct(title: $title, subtitle: $subtitle, price: $price, rating: $rating, location: $location)';
}


}

/// @nodoc
abstract mixin class $MarketplaceProductCopyWith<$Res>  {
  factory $MarketplaceProductCopyWith(MarketplaceProduct value, $Res Function(MarketplaceProduct) _then) = _$MarketplaceProductCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, double price, double rating, String location
});




}
/// @nodoc
class _$MarketplaceProductCopyWithImpl<$Res>
    implements $MarketplaceProductCopyWith<$Res> {
  _$MarketplaceProductCopyWithImpl(this._self, this._then);

  final MarketplaceProduct _self;
  final $Res Function(MarketplaceProduct) _then;

/// Create a copy of MarketplaceProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = null,Object? price = null,Object? rating = null,Object? location = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MarketplaceProduct].
extension MarketplaceProductPatterns on MarketplaceProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarketplaceProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarketplaceProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarketplaceProduct value)  $default,){
final _that = this;
switch (_that) {
case _MarketplaceProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarketplaceProduct value)?  $default,){
final _that = this;
switch (_that) {
case _MarketplaceProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String subtitle,  double price,  double rating,  String location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarketplaceProduct() when $default != null:
return $default(_that.title,_that.subtitle,_that.price,_that.rating,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String subtitle,  double price,  double rating,  String location)  $default,) {final _that = this;
switch (_that) {
case _MarketplaceProduct():
return $default(_that.title,_that.subtitle,_that.price,_that.rating,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String subtitle,  double price,  double rating,  String location)?  $default,) {final _that = this;
switch (_that) {
case _MarketplaceProduct() when $default != null:
return $default(_that.title,_that.subtitle,_that.price,_that.rating,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarketplaceProduct implements MarketplaceProduct {
  const _MarketplaceProduct({required this.title, this.subtitle = '', this.price = 0.0, this.rating = 0.0, this.location = ''});
  factory _MarketplaceProduct.fromJson(Map<String, dynamic> json) => _$MarketplaceProductFromJson(json);

@override final  String title;
@override@JsonKey() final  String subtitle;
@override@JsonKey() final  double price;
@override@JsonKey() final  double rating;
@override@JsonKey() final  String location;

/// Create a copy of MarketplaceProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarketplaceProductCopyWith<_MarketplaceProduct> get copyWith => __$MarketplaceProductCopyWithImpl<_MarketplaceProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarketplaceProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarketplaceProduct&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.price, price) || other.price == price)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,subtitle,price,rating,location);

@override
String toString() {
  return 'MarketplaceProduct(title: $title, subtitle: $subtitle, price: $price, rating: $rating, location: $location)';
}


}

/// @nodoc
abstract mixin class _$MarketplaceProductCopyWith<$Res> implements $MarketplaceProductCopyWith<$Res> {
  factory _$MarketplaceProductCopyWith(_MarketplaceProduct value, $Res Function(_MarketplaceProduct) _then) = __$MarketplaceProductCopyWithImpl;
@override @useResult
$Res call({
 String title, String subtitle, double price, double rating, String location
});




}
/// @nodoc
class __$MarketplaceProductCopyWithImpl<$Res>
    implements _$MarketplaceProductCopyWith<$Res> {
  __$MarketplaceProductCopyWithImpl(this._self, this._then);

  final _MarketplaceProduct _self;
  final $Res Function(_MarketplaceProduct) _then;

/// Create a copy of MarketplaceProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? price = null,Object? rating = null,Object? location = null,}) {
  return _then(_MarketplaceProduct(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
