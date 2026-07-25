import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_view_model.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RecycleSuccessScreen extends ConsumerWidget {
  const RecycleSuccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recycleState = ref.watch(recycleViewModelProvider);
    final points = recycleState.resultTotalPoints ?? 0;
    final commission = recycleState.resultCommissionTl ?? 0.0;

    return Scaffold(
      backgroundColor: context.isDarkMode
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            LucideIcons.arrowLeft,
            color: context.isDarkMode
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
        ),
        title: Text(
          'Dönüştür',
          style: TextStyle(
            color: context.isDarkMode
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                color: const Color(0xFF10B981).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                LucideIcons.check,
                color: const Color(0xFF10B981),
                size: 48.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'Tebrikler!',
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              '$points puan kazandın ve çevreye\nkatkıda bulundun.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontSize: 16.sp,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.h),

            // Impact Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: const Color(0xFF064E3B), // Dark Green
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: const Color(0xFF10B981).withOpacity(0.3),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    LucideIcons.droplets,
                    color: const Color(0xFF34D399),
                    size: 32.sp,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '$points Puan',
                    style: TextStyle(
                      color: Colors.white, // On dark-green impact card fill
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    commission > 0
                        ? '₺${commission.toStringAsFixed(2)} komisyon kazandın!'
                        : 'Çevreye katkınız için teşekkürler!',
                    style: TextStyle(
                      color: const Color(0xFF34D399),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Buttons
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  ref.read(recycleViewModelProvider.notifier).reset();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  backgroundColor: const Color(0xFF1F2937),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Ana Sayfaya Dön',
                  style: TextStyle(
                    color: Colors.white, // On solid dark surface button fill
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
