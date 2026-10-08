import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/core/network/api_service.dart';
import 'package:teknolup/core/network/i_api_service.dart';
import 'package:teknolup/features/recycle/domain/repositories/recycle_repository.dart';

class RecycleRepositoryImpl implements RecycleRepository {
  final IApiService _api;
  RecycleRepositoryImpl(this._api);

  @override
  Future<Map<String, dynamic>> logRecycle({
    required String userId,
    String? centerId,
    required String wasteType,
    required double weightKg,
    required bool isElectricTransport,
  }) {
    return _api.logRecycle({
      'userId': userId,
      'serviceCenterId': centerId,
      'wasteType': wasteType,
      'weightKg': weightKg,
      'isElectricTransport': isElectricTransport,
    });
  }
}

final recycleRepositoryProvider = Provider<RecycleRepository>(
  (ref) => RecycleRepositoryImpl(ref.watch(apiServiceProvider)),
);
