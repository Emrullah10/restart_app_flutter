abstract class IApiService {
  Future<Map<String, dynamic>> getMotivationMessage(
    String productModel,
    String condition,
  );
  Future<List<dynamic>> findCouriers(double lat, double lng);
  Future<bool> sendContactMessage(Map<String, dynamic> data);
}
