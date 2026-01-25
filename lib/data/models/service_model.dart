import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

List<String> _tagsFromJson(dynamic json) {
  if (json is List) {
    return json.map((e) => e.toString()).toList();
  } else if (json is String) {
    return json
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }
  return [];
}

double _toDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

@freezed
abstract class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    required String id,
    required String name,
    required String type,
    @JsonKey(fromJson: _toDouble) required double latitude,
    @JsonKey(fromJson: _toDouble) required double longitude,
    @JsonKey(fromJson: _toDouble) required double rating,
    @JsonKey(fromJson: _tagsFromJson) @Default([]) List<String> tags,
    required String address,
    @Default(true) bool isActive,
    // PostGIS'ten gelen mesafe bilgisi (metre)
    @JsonKey(name: 'distanceMeters', fromJson: _toDouble)
    @Default(0)
    double distanceMeters,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
}

/// Mesafeyi kullanıcı dostu formata çevirir
extension ServiceModelExtensions on ServiceModel {
  String get formattedDistance {
    if (distanceMeters <= 0) return '';
    if (distanceMeters < 1000) {
      return '${distanceMeters.round()} m';
    } else {
      return '${(distanceMeters / 1000).toStringAsFixed(1)} km';
    }
  }
}
