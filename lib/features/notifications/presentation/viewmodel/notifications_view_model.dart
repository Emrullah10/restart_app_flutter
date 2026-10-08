import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:teknolup/features/notifications/data/models/app_notification.dart';
import 'package:teknolup/features/notifications/data/repositories/notifications_repository_impl.dart';

class NotificationsViewModel
    extends AutoDisposeAsyncNotifier<List<AppNotification>> {
  @override
  Future<List<AppNotification>> build() async {
    final userId = ref.watch(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return const [];
    return ref.watch(notificationsRepositoryProvider).getNotifications(userId);
  }

  Future<void> markAllAsRead() async {
    final userId = ref.read(authViewModelProvider).valueOrNull?.id;
    if (userId == null) return;
    await ref.read(notificationsRepositoryProvider).markAllAsRead(userId);
    ref.invalidateSelf();
  }
}

final notificationsViewModelProvider = AutoDisposeAsyncNotifierProvider<
    NotificationsViewModel, List<AppNotification>>(
  NotificationsViewModel.new,
);
