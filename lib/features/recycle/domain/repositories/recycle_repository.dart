abstract interface class RecycleRepository {
  Future<void> logRecycle({
    required String userId,
    String? centerId,
    required String wasteType,
    required double weightKg,
    required bool isElectricTransport,
  });
}
