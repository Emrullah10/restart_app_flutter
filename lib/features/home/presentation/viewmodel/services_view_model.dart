import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/features/home/data/models/nearby_service.dart';
import 'package:teknolup/features/home/data/repositories/home_repository_impl.dart';

class ServicesViewModel extends AutoDisposeAsyncNotifier<List<NearbyService>> {
  @override
  Future<List<NearbyService>> build() {
    return ref.watch(homeRepositoryProvider).getServices();
  }
}

final servicesViewModelProvider =
    AutoDisposeAsyncNotifierProvider<ServicesViewModel, List<NearbyService>>(
      ServicesViewModel.new,
    );

final servicesByTypeProvider = FutureProvider.autoDispose
    .family<List<NearbyService>, String?>((ref, type) {
      return ref.watch(homeRepositoryProvider).getServices(type: type);
    });
