import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/core/network/api_service.dart';
import 'package:teknolup/core/network/i_api_service.dart';
import 'package:teknolup/features/home/data/models/activity.dart';
import 'package:teknolup/features/home/data/models/nearby_service.dart';
import 'package:teknolup/features/home/domain/repositories/home_repository.dart';

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  return double.tryParse(value.toString()) ?? 0.0;
}

class HomeRepositoryImpl implements HomeRepository {
  final IApiService _api;
  HomeRepositoryImpl(this._api);

  @override
  Future<List<NearbyService>> getServices({String? type}) async {
    final data = await _api.getServices(type: type);
    return data.map((raw) {
      final json = raw as Map<String, dynamic>;
      // Backend returns tags as a string[] (service.entity.js splits on
      // comma), not a single string.
      final tagsList = (json['tags'] as List?) ?? const [];
      return NearbyService(
        id: json['id']?.toString(),
        name: json['name']?.toString() ?? '',
        type: json['type']?.toString(),
        rating: _parseDouble(json['rating']),
        tags: tagsList.join(', '),
        address: json['address']?.toString() ?? '',
        latitude: json['latitude'] == null
            ? null
            : _parseDouble(json['latitude']),
        longitude: json['longitude'] == null
            ? null
            : _parseDouble(json['longitude']),
      );
    }).toList();
  }

  @override
  Future<List<Activity>> getActivities(String userId, {int limit = 10}) async {
    final data = await _api.getActivities(userId, limit: limit);
    return data.map((raw) {
      final json = raw as Map<String, dynamic>;
      return Activity(
        // Backend field is "activityType" (activity.entity.js), not "type".
        type: json['activityType']?.toString() ?? 'default',
        title: json['title']?.toString() ?? '',
        pointsEarned: (json['pointsEarned'] as num?)?.toInt() ?? 0,
        amountEarned: _parseDouble(json['amountEarned']),
        createdAt:
            DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
            DateTime.now(),
      );
    }).toList();
  }
}

final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) => HomeRepositoryImpl(ref.watch(apiServiceProvider)),
);
