/// User profile model
class UserProfileModel {
  final String id;
  final String email;
  final String fullName;
  final String? avatarUrl;
  final String role;
  final int totalPoints;
  final int recycleCount;
  final int level;
  final double totalEarnings;
  final int repairedCount;
  final double preventedWasteKg;
  final String co2Saved;

  UserProfileModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.avatarUrl,
    required this.role,
    required this.totalPoints,
    required this.recycleCount,
    required this.level,
    required this.totalEarnings,
    required this.repairedCount,
    required this.preventedWasteKg,
    required this.co2Saved,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id']?.toString() ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      avatarUrl: json['avatarUrl'],
      role: json['role'] ?? 'user',
      totalPoints: json['totalPoints'] ?? 0,
      recycleCount: json['recycleCount'] ?? 0,
      level: json['level'] ?? 1,
      totalEarnings: _parseDouble(json['totalEarnings']),
      repairedCount: json['repairedCount'] ?? 0,
      preventedWasteKg: _parseDouble(json['preventedWasteKg']),
      co2Saved: json['co2Saved']?.toString() ?? '0.0',
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }
}
