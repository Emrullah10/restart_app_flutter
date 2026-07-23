import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:mobile_flutter/features/profile/presentation/widgets/badge_gallery.dart';
import 'package:mobile_flutter/features/profile/presentation/widgets/carbon_savings_card.dart';
import 'package:mobile_flutter/features/profile/presentation/widgets/leaderboard_card.dart';
import 'package:mobile_flutter/features/profile/presentation/widgets/profile_activity_list.dart';
import 'package:mobile_flutter/features/profile/presentation/widgets/profile_header.dart';
import 'package:mobile_flutter/features/profile/presentation/widgets/profile_stats_row.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileViewModelProvider);
    final profile = profileAsync.valueOrNull;

    if (profileAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFF10B981)),
        ),
      );
    }
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          context.l10n.profileTitle,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.appBarTheme.titleTextStyle?.color,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            LucideIcons.arrowLeft,
            color: context.theme.iconTheme.color,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              LucideIcons.settings,
              color: context.theme.iconTheme.color,
            ),
            onPressed: () => context.push(Routes.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 32.h),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            ProfileHeader(
              fullName: profile?.fullName ?? 'User',
              role: profile?.role ?? 'Member',
            ),
            SizedBox(height: 32.h),
            ProfileStatsRow(
              points: (profile?.totalPoints ?? 0).toString(),
              recycleCount: (profile?.recycleCount ?? 0).toString(),
            ),
            SizedBox(height: 32.h),
            CarbonSavingsCard(co2Saved: profile?.co2Saved ?? '0.0'),
            SizedBox(height: 32.h),
            const LeaderboardCard(),
            SizedBox(height: 32.h),
            const BadgeGallery(),
            SizedBox(height: 32.h),
            const ProfileActivityList(),
          ],
        ),
      ),
    );
  }
}
