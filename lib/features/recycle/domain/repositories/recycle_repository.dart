abstract interface class RecycleRepository {
  Future<void> logRecycle({
    required String userId,
    required String centerId,
    required String wasteType,
    required double amount,
    required String transportMode,
  });
}
