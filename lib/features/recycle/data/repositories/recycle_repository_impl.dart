import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/network/i_api_service.dart';
import 'package:mobile_flutter/features/recycle/domain/repositories/recycle_repository.dart';

class RecycleRepositoryImpl implements RecycleRepository {
  final IApiService _api;
  RecycleRepositoryImpl(this._api);

  @override
  Future<void> logRecycle({
    required String userId,
    required String centerId,
    required String wasteType,
    required double amount,
    required String transportMode,
  }) {
    return _api.logRecycle({
      'userId': userId,
      'centerId': centerId,
      'wasteType': wasteType,
      'amount': amount,
      'transportMode': transportMode,
    });
  }
}

final recycleRepositoryProvider = Provider<RecycleRepository>(
  (ref) => RecycleRepositoryImpl(ref.watch(apiServiceProvider)),
);
