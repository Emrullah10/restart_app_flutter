import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_action_screen.dart';
import 'package:mobile_flutter/presentation/recycle/widgets/device_option_card.dart';
import 'package:mobile_flutter/presentation/recycle/widgets/recycle_header.dart';
import 'package:mobile_flutter/utils/constants/app_colors.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class RecycleScreen extends StatelessWidget {
  const RecycleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const RecycleHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Text(
                      context.l10n.recycleQuestion,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      context.l10n.recycleSubtitle,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.brightness == Brightness.dark
                            ? Colors.grey[400]
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    DeviceOptionCard(
                      icon: LucideIcons.smartphone,
                      title: context.l10n.devicePhone,
                      subtitle: context.l10n.devicePhoneSub,
                      iconColor: const Color(0xFF3B82F6),
                      onTap: () => _navigateToAction(context),
                    ),
                    DeviceOptionCard(
                      icon: LucideIcons.laptop,
                      title: context.l10n.deviceLaptop,
                      subtitle: context.l10n.deviceLaptopSub,
                      iconColor: const Color(0xFFA855F7), // Purple
                      onTap: () => _navigateToAction(context),
                    ),
                    DeviceOptionCard(
                      icon: LucideIcons.tablet,
                      title: context.l10n.deviceTablet,
                      subtitle: context.l10n.deviceTabletSub,
                      iconColor: const Color(0xFF10B981), // Green
                      onTap: () => _navigateToAction(context),
                    ),
                    DeviceOptionCard(
                      icon: LucideIcons.cpu,
                      title: context.l10n.deviceOther,
                      subtitle: context.l10n.deviceOtherSub,
                      iconColor: const Color(0xFFF59E0B), // Amber
                      onTap: () => _navigateToAction(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAction(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RecycleActionScreen()),
    );
  }
}
