import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/sell/data/repositories/marketplace_repository_impl.dart';
import 'package:mobile_flutter/features/sell/presentation/viewmodel/marketplace_view_model.dart';

class CreateListingViewModel extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<bool> publish({
    required String title,
    required String description,
    required String category,
    required double price,
    required String location,
    required List<String> imageFilePaths,
  }) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() async {
      final userId = ref.read(authViewModelProvider).valueOrNull?.id;
      if (userId == null) {
        throw Exception('Oturum bulunamadı');
      }
      final repo = ref.read(marketplaceRepositoryProvider);
      final imageUrls = imageFilePaths.isEmpty
          ? <String>[]
          : await repo.uploadListingImages(imageFilePaths);
      await repo.createListing(
        userId: userId,
        title: title,
        description: description,
        category: category,
        price: price,
        location: location,
        images: imageUrls,
      );
      ref.invalidate(listingsViewModelProvider);
    });
    state = result;
    return !result.hasError;
  }
}

final createListingViewModelProvider =
    AutoDisposeAsyncNotifierProvider<CreateListingViewModel, void>(
      CreateListingViewModel.new,
    );
