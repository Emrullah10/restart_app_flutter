import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/profile/presentation/viewmodel/profile_view_model.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class EnvironmentalImpactGrid extends ConsumerWidget {
  const EnvironmentalImpactGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileViewModelProvider).valueOrNull;

    // Extract values with fallbacks
    final repairedCount = (profile?.repairedCount ?? 0).toString();
    final preventedWasteKg =
        '${(profile?.preventedWasteKg ?? 0.0).toStringAsFixed(1)}kg';
    final totalEarnings =
        '₺${(profile?.totalEarnings ?? 0.0).toStringAsFixed(0)}';
    final level = (profile?.level ?? 1).toString();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.environmentalImpactTitle,
            style: TextStyle(
              color: context.isDarkMode
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  repairedCount,
                  context.l10n.statRepairedDevices,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatCard(
                  context,
                  preventedWasteKg,
                  context.l10n.statPreventedWaste,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  totalEarnings,
                  context.l10n.statTotalEarnings,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatCard(
                  context,
                  context.l10n.statLevel(level),
                  context.l10n.statEcoWarrior,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String value, String label) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppColors.surfaceDark
            : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.theme.dividerColor.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: context.isDarkMode
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(
              color: context.isDarkMode
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
