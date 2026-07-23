import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  repairedCount,
                  context.l10n.statRepairedDevices,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatCard(
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
                  totalEarnings,
                  context.l10n.statTotalEarnings,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatCard(
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

  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
