import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/rewards/widgets/achievements_section.dart';
import 'package:mobile_flutter/presentation/rewards/widgets/points_breakdown_row.dart';
import 'package:mobile_flutter/presentation/rewards/widgets/rewards_section.dart';
import 'package:mobile_flutter/presentation/rewards/widgets/sustainability_level_card.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';
import 'package:mobile_flutter/utils/extensions/padding_extensions.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // Since this is in bottom nav, we might not need leading back button
        // if it replaces Statistics tab.
        // But user design shows a back button, suggesting it might be pushed
        // or they just used a standard header design.
        // Given instruction "navigation barda istatistik yerine koyabilirsin",
        // I will hide the back button automatically implied by AppBar unless pushed.
        // However, I will add the Title and Bell icon as per design.
        automaticallyImplyLeading: false,
        title: Text(
          context.l10n.rewardsTitle,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.appBarTheme.titleTextStyle?.color,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(LucideIcons.bell, color: context.theme.iconTheme.color),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 24.w.allP,
          child: Column(
            children: [
              const SustainabilityLevelCard(),
              SizedBox(height: 32.h),
              Text(
                '1,250',
                style: context.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              Text(
                context.l10n.totalPoints,
                style: context.textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 24.h),
              const PointsBreakdownRow(),
              SizedBox(height: 32.h),
              const RewardsSection(),
              SizedBox(height: 32.h),
              const AchievementsSection(),
              SizedBox(
                height: 120.h,
              ), // Bottom padding for scrolling over nav bar
            ],
          ),
        ),
      ),
    );
  }
}
