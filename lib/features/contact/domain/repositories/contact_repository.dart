abstract interface class ContactRepository {
  Future<bool> sendMessage({
    required String name,
    required String email,
    required String message,
  });
}
