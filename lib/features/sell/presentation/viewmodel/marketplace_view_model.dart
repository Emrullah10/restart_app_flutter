import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:teknolup/features/sell/data/models/listing.dart';
import 'package:teknolup/features/sell/data/models/marketplace_product.dart';
import 'package:teknolup/features/sell/data/repositories/marketplace_repository_impl.dart';

class ListingsViewModel extends AutoDisposeAsyncNotifier<List<Listing>> {
  @override
  Future<List<Listing>> build() async {
    final userId = ref.watch(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return const [];
    return ref.watch(marketplaceRepositoryProvider).getUserListings(userId);
  }
}

final listingsViewModelProvider =
    AutoDisposeAsyncNotifierProvider<ListingsViewModel, List<Listing>>(
      ListingsViewModel.new,
    );

class ProductsViewModel
    extends AutoDisposeAsyncNotifier<List<MarketplaceProduct>> {
  @override
  Future<List<MarketplaceProduct>> build() {
    return ref.watch(marketplaceRepositoryProvider).getProducts();
  }
}

final productsViewModelProvider =
    AutoDisposeAsyncNotifierProvider<
      ProductsViewModel,
      List<MarketplaceProduct>
    >(ProductsViewModel.new);
