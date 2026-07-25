import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_service.freezed.dart';
part 'nearby_service.g.dart';

@freezed
abstract class NearbyService with _$NearbyService {
  const factory NearbyService({
    String? id,
    required String name,
    String? type,
    @Default(0.0) double rating,
    @Default('') String tags,
    @Default('') String address,
    double? latitude,
    double? longitude,
  }) = _NearbyService;

  factory NearbyService.fromJson(Map<String, dynamic> json) =>
      _$NearbyServiceFromJson(json);
}
