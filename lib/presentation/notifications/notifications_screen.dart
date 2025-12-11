import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/notifications/widgets/notification_item_card.dart';
import 'package:mobile_flutter/presentation/notifications/widgets/notification_tabs.dart';
import 'package:mobile_flutter/presentation/notifications/widgets/weekly_event_card.dart';
import 'package:mobile_flutter/utils/constants/app_colors.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            icon: const Icon(LucideIcons.moreVertical, color: Colors.white),
            onPressed: () {},
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
                  NotificationItemCard(
                    icon: LucideIcons.gift,
                    iconColor: const Color(0xFF3B82F6),
                    iconBgColor: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                    title: context.l10n.rewardProgramTitle,
                    description: context.l10n.rewardProgramDesc,
                    time: context.l10n.timeHoursAgo(2),
                    actionText: context.l10n.claimRewardButton,
                    actionColor: const Color(0xFF3B82F6),
                  ),
                  NotificationItemCard(
                    icon: LucideIcons.users,
                    iconColor: const Color(0xFFF97316), // Orange
                    iconBgColor: const Color(0xFFF97316).withValues(alpha: 0.1),
                    title: context.l10n.communityEventTitle,
                    description: context.l10n.communityEventDesc,
                    time: context.l10n.timeDaysAgo(1),
                    actionText: context.l10n.joinButton,
                    actionColor: Colors.white,
                    actionBgColor: const Color(
                      0xFFD97706,
                    ), // Dark Orange Button
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
}
