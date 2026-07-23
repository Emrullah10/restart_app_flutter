import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/home/data/models/activity.dart';
import 'package:mobile_flutter/features/home/data/repositories/home_repository_impl.dart';

class ActivityViewModel extends AutoDisposeAsyncNotifier<List<Activity>> {
  @override
  Future<List<Activity>> build() async {
    final userId = ref.watch(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return const [];
    return ref.watch(homeRepositoryProvider).getActivities(userId, limit: 10);
  }
}

final activityViewModelProvider =
    AutoDisposeAsyncNotifierProvider<ActivityViewModel, List<Activity>>(
      ActivityViewModel.new,
    );
