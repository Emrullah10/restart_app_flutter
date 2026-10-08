import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teknolup/core/network/api_service.dart';
import 'package:teknolup/core/network/i_api_service.dart';
import 'package:teknolup/features/notifications/data/models/app_notification.dart';
import 'package:teknolup/features/notifications/domain/repositories/notifications_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final IApiService _api;
  NotificationsRepositoryImpl(this._api);

  @override
  Future<List<AppNotification>> getNotifications(String userId) async {
    final data = await _api.getNotifications(userId);
    return data.map((raw) {
      final json = raw as Map<String, dynamic>;
      return AppNotification(
        id: json['id']?.toString() ?? '',
        type: json['type']?.toString() ?? 'general',
        title: json['title']?.toString() ?? '',
        body: json['body']?.toString() ?? '',
        isRead: json['isRead'] == true,
        createdAt:
            DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
            DateTime.now(),
      );
    }).toList();
  }

  @override
  Future<void> markAllAsRead(String userId) {
    return _api.markAllNotificationsRead(userId);
  }
}

final notificationsRepositoryProvider = Provider<NotificationsRepository>(
  (ref) => NotificationsRepositoryImpl(ref.watch(apiServiceProvider)),
);
