import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_flutter/presentation/auth/riverpod/auth_provider.dart';
import 'package:mobile_flutter/presentation/home/widgets/action_buttons_grid.dart';
import 'package:mobile_flutter/presentation/home/widgets/environmental_impact_grid.dart';
import 'package:mobile_flutter/presentation/home/widgets/home_header.dart';
import 'package:mobile_flutter/presentation/home/widgets/impact_summary_card.dart';
import 'package:mobile_flutter/presentation/home/widgets/nearby_services_list.dart';
import 'package:mobile_flutter/presentation/home/widgets/recent_activity_list.dart';
import 'package:mobile_flutter/presentation/profile/riverpod/profile_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';
import 'package:mobile_flutter/utils/extensions/padding_extensions.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final profileState = ref.watch(profileProvider);
    final user = authState.user;
    final profile = profileState.profile;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(
              fullName: user?['fullName'] ?? '',
              avatarUrl: user?['avatarUrl'],
            ),

            Padding(
              padding: [24, 8].horizantalAndVerticalP,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.homeTitle,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    context.l10n.homeSubtitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.theme.colorScheme.onSurface.withOpacity(
                        0.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),
            ImpactSummaryCard(co2Saved: (profile?.co2Saved ?? '0.0')),

            SizedBox(height: 32.h),
            Padding(
              padding: 24.horizontalP,
              child: Text(
                context.l10n.whatToDo,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            const ActionButtonsGrid(),

            SizedBox(height: 32.h),
            const RecentActivityList(),

            SizedBox(height: 32.h),
            const EnvironmentalImpactGrid(),

            SizedBox(height: 32.h),
            const NearbyServicesList(),

            SizedBox(height: 100.h), // Bottom padding for nav bar
          ],
        ),
      ),
    );
  }
}
