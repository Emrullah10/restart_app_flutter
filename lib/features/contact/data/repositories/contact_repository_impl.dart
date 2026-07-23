import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/network/i_api_service.dart';
import 'package:mobile_flutter/features/contact/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final IApiService _api;
  ContactRepositoryImpl(this._api);

  @override
  Future<bool> sendMessage({
    required String name,
    required String email,
    required String message,
  }) {
    return _api.sendContactMessage({
      'name': name,
      'email': email,
      'message': message,
    });
  }
}

final contactRepositoryProvider = Provider<ContactRepository>(
  (ref) => ContactRepositoryImpl(ref.watch(apiServiceProvider)),
);
