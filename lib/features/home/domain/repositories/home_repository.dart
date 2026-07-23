import 'package:mobile_flutter/features/home/data/models/activity.dart';
import 'package:mobile_flutter/features/home/data/models/nearby_service.dart';

abstract interface class HomeRepository {
  Future<List<NearbyService>> getServices({String? type});
  Future<List<Activity>> getActivities(String userId, {int limit = 10});
}
