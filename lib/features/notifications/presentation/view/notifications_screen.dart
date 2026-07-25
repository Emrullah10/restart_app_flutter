import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/notifications/data/models/app_notification.dart';
import 'package:mobile_flutter/features/notifications/presentation/viewmodel/notifications_view_model.dart';
import 'package:mobile_flutter/features/notifications/presentation/widgets/notification_item_card.dart';
import 'package:mobile_flutter/features/notifications/presentation/widgets/notification_tabs.dart';
import 'package:mobile_flutter/features/notifications/presentation/widgets/weekly_event_card.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  IconData _iconForType(String type) {
    switch (type) {
      case 'reward':
        return LucideIcons.gift;
      case 'community':
        return LucideIcons.users;
      default:
        return LucideIcons.bell;
    }
  }

  Color _colorForType(String type) {
    switch (type) {
      case 'reward':
        return const Color(0xFF3B82F6);
      case 'community':
        return const Color(0xFFF97316);
      default:
        return const Color(0xFF6B7280);
    }
  }

  String _formatTimeAgo(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inHours < 24) return '${difference.inHours} saat önce';
    return '${difference.inDays} gün önce';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsViewModelProvider);
    final notifications = notificationsAsync.valueOrNull ?? const [];

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          context.l10n.notificationsTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(LucideIcons.moreVertical, color: Colors.white),
            onSelected: (value) async {
              if (value == 'mark_all_read') {
                await ref
                    .read(notificationsViewModelProvider.notifier)
                    .markAllAsRead();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.l10n.allMarkedAsRead)),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'mark_all_read',
                child: Text(context.l10n.markAllAsRead),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const NotificationTabs(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const WeeklyEventCard(),
                  if (notificationsAsync.isLoading)
                    const Padding(
                      padding: EdgeInsets.all(24),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (notifications.isEmpty)
                    Padding(
                      padding: EdgeInsets.all(24.w),
                      child: Text(context.l10n.noResults),
                    )
                  else
                    ...notifications.map(
                      (notification) => _buildNotificationCard(
                        context,
                        notification,
                      ),
                    ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    AppNotification notification,
  ) {
    final color = _colorForType(notification.type);
    return NotificationItemCard(
      icon: _iconForType(notification.type),
      iconColor: color,
      iconBgColor: color.withValues(alpha: 0.1),
      title: notification.title,
      description: notification.body,
      time: _formatTimeAgo(notification.createdAt),
    );
  }
}
