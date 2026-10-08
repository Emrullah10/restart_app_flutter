import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:teknolup/features/profile/data/models/user_profile.dart';
import 'package:teknolup/features/profile/data/repositories/profile_repository_impl.dart';

class ProfileViewModel extends AutoDisposeAsyncNotifier<UserProfile?> {
  @override
  Future<UserProfile?> build() async {
    final userId = ref.watch(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return null;
    return ref.watch(profileRepositoryProvider).getProfile(userId);
  }

  Future<void> refresh() async {
    final userId = ref.read(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(profileRepositoryProvider).getProfile(userId),
    );
  }
}

final profileViewModelProvider =
    AutoDisposeAsyncNotifierProvider<ProfileViewModel, UserProfile?>(
      ProfileViewModel.new,
    );
