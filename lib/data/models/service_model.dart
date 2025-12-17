/// Service location model for repair shops, recycle centers, etc.
class ServiceModel {
  final String id;
  final String name;
  final String type;
  final double latitude;
  final double longitude;
  final double rating;
  final String tags;
  final String address;

  ServiceModel({
    required this.id,
    required this.name,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.tags,
    required this.address,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      latitude: _parseDouble(json['latitude']),
      longitude: _parseDouble(json['longitude']),
      rating: _parseDouble(json['rating']),
      tags: json['tags'] ?? '',
      address: json['address'] ?? '',
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'tags': tags,
      'address': address,
    };
  }
}
