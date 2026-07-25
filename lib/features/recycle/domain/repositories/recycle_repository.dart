abstract interface class RecycleRepository {
  Future<Map<String, dynamic>> logRecycle({
    required String userId,
    String? centerId,
    required String wasteType,
    required double weightKg,
    required bool isElectricTransport,
  });
}
