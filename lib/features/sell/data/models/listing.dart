import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

@freezed
abstract class Listing with _$Listing {
  const factory Listing({
    required String title,
    @Default('') String subtitle,
    @Default(0.0) double price,
    @Default('active') String status,
    @Default([]) List<String> images,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) =>
      _$ListingFromJson(json);
}
