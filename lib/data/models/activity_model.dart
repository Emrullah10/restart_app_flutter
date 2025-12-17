/// Activity model for user activities
class ActivityModel {
  final String id;
  final String type;
  final String title;
  final String description;
  final int pointsEarned;
  final double amountEarned;
  final DateTime createdAt;

  ActivityModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.pointsEarned,
    required this.amountEarned,
    required this.createdAt,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id']?.toString() ?? '',
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      pointsEarned: json['pointsEarned'] ?? 0,
      amountEarned: _parseDouble(json['amountEarned']),
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }
}
