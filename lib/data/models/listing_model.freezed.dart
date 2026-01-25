// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListingModel {

 String get id; String get title; String get description; String get category; double get price; String get status; String? get imageUrl; bool get isSold; DateTime? get createdAt;
/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingModelCopyWith<ListingModel> get copyWith => _$ListingModelCopyWithImpl<ListingModel>(this as ListingModel, _$identity);

  /// Serializes this ListingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isSold, isSold) || other.isSold == isSold)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,category,price,status,imageUrl,isSold,createdAt);

@override
String toString() {
  return 'ListingModel(id: $id, title: $title, description: $description, category: $category, price: $price, status: $status, imageUrl: $imageUrl, isSold: $isSold, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ListingModelCopyWith<$Res>  {
  factory $ListingModelCopyWith(ListingModel value, $Res Function(ListingModel) _then) = _$ListingModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String category, double price, String status, String? imageUrl, bool isSold, DateTime? createdAt
});




}
/// @nodoc
class _$ListingModelCopyWithImpl<$Res>
    implements $ListingModelCopyWith<$Res> {
  _$ListingModelCopyWithImpl(this._self, this._then);

  final ListingModel _self;
  final $Res Function(ListingModel) _then;

/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? category = null,Object? price = null,Object? status = null,Object? imageUrl = freezed,Object? isSold = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isSold: null == isSold ? _self.isSold : isSold // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingModel].
extension ListingModelPatterns on ListingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingModel value)  $default,){
final _that = this;
switch (_that) {
case _ListingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String category,  double price,  String status,  String? imageUrl,  bool isSold,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.status,_that.imageUrl,_that.isSold,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String category,  double price,  String status,  String? imageUrl,  bool isSold,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ListingModel():
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.status,_that.imageUrl,_that.isSold,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String category,  double price,  String status,  String? imageUrl,  bool isSold,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ListingModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.status,_that.imageUrl,_that.isSold,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingModel implements ListingModel {
  const _ListingModel({required this.id, required this.title, required this.description, required this.category, required this.price, this.status = 'active', this.imageUrl, this.isSold = false, this.createdAt});
  factory _ListingModel.fromJson(Map<String, dynamic> json) => _$ListingModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String category;
@override final  double price;
@override@JsonKey() final  String status;
@override final  String? imageUrl;
@override@JsonKey() final  bool isSold;
@override final  DateTime? createdAt;

/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingModelCopyWith<_ListingModel> get copyWith => __$ListingModelCopyWithImpl<_ListingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isSold, isSold) || other.isSold == isSold)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,category,price,status,imageUrl,isSold,createdAt);

@override
String toString() {
  return 'ListingModel(id: $id, title: $title, description: $description, category: $category, price: $price, status: $status, imageUrl: $imageUrl, isSold: $isSold, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ListingModelCopyWith<$Res> implements $ListingModelCopyWith<$Res> {
  factory _$ListingModelCopyWith(_ListingModel value, $Res Function(_ListingModel) _then) = __$ListingModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String category, double price, String status, String? imageUrl, bool isSold, DateTime? createdAt
});




}
/// @nodoc
class __$ListingModelCopyWithImpl<$Res>
    implements _$ListingModelCopyWith<$Res> {
  __$ListingModelCopyWithImpl(this._self, this._then);

  final _ListingModel _self;
  final $Res Function(_ListingModel) _then;

/// Create a copy of ListingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? category = null,Object? price = null,Object? status = null,Object? imageUrl = freezed,Object? isSold = null,Object? createdAt = freezed,}) {
  return _then(_ListingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isSold: null == isSold ? _self.isSold : isSold // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
