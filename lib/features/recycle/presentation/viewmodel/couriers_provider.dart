import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/core/network/api_service.dart';
import 'package:teknolup/core/utils/geo.dart';

class CourierOption {
  final String name;
  final double? km;
  final bool electric;
  const CourierOption(this.name, this.km, this.electric);
}

/// Couriers near the user (falls back to Istanbul centre when location is unavailable).
final couriersProvider = FutureProvider.autoDispose<List<CourierOption>>((ref) async {
  final pos = await ref.watch(userLocationProvider.future);
  final lat = pos?.latitude ?? 41.0082, lng = pos?.longitude ?? 28.9784;
  final raw = await ref.watch(apiServiceProvider).findCouriers(lat, lng);
  return raw.whereType<Map<String, dynamic>>().map((j) {
    final meters = (j['distance_meters'] as num?)?.toDouble();
    final km = meters != null ? meters / 1000 : (j['distance'] as num?)?.toDouble();
    final electric = j['is_electric'] == true || '${j['vehicle'] ?? ''}'.contains('green');
    return CourierOption((j['full_name'] ?? j['name'] ?? '').toString(), km, electric);
  }).toList();
});
