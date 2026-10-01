import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

/// Current position, or null when permission is denied / services are off (distances are then hidden).
final userLocationProvider = FutureProvider<Position?>((ref) async {
  try {
    if (!await Geolocator.isLocationServiceEnabled()) return null;
    var perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) perm = await Geolocator.requestPermission();
    if (perm == LocationPermission.denied || perm == LocationPermission.deniedForever) return null;
    return await Geolocator.getCurrentPosition(locationSettings: const LocationSettings(accuracy: LocationAccuracy.low, timeLimit: Duration(seconds: 8)));
  } catch (_) {
    return null;
  }
});

double? distanceKm(Position? from, double? lat, double? lng) {
  if (from == null || lat == null || lng == null) return null;
  double rad(double d) => d * math.pi / 180;
  final dLat = rad(lat - from.latitude), dLng = rad(lng - from.longitude);
  final h = math.pow(math.sin(dLat / 2), 2) + math.cos(rad(from.latitude)) * math.cos(rad(lat)) * math.pow(math.sin(dLng / 2), 2);
  return 2 * 6371 * math.asin(math.sqrt(h));
}
