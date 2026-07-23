import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketplace_product.freezed.dart';
part 'marketplace_product.g.dart';

@freezed
abstract class MarketplaceProduct with _$MarketplaceProduct {
  const factory MarketplaceProduct({
    required String title,
    @Default('') String subtitle,
    @Default(0.0) double price,
    @Default(0.0) double rating,
    @Default('') String location,
  }) = _MarketplaceProduct;

  factory MarketplaceProduct.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceProductFromJson(json);
}
