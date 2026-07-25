import 'package:mobile_flutter/features/notifications/data/models/app_notification.dart';

abstract interface class NotificationsRepository {
  Future<List<AppNotification>> getNotifications(String userId);
  Future<void> markAllAsRead(String userId);
}
