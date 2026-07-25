import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/home/presentation/viewmodel/services_view_model.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_cargo_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_view_model.dart';
import 'package:mobile_flutter/features/recycle/presentation/widgets/recycle_header.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RecycleMapScreen extends ConsumerWidget {
  const RecycleMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final centersAsync = ref.watch(servicesByTypeProvider('recycle'));

    return Scaffold(
      backgroundColor: context.isDarkMode
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            const RecycleHeader(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'En Yakın Noktalar',
                      style: TextStyle(
                        color: context.isDarkMode
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: centersAsync.when(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (error, _) => Center(
                          child: Text('Hata: $error'),
                        ),
                        data: (centers) => centers.isEmpty
                            ? Center(child: Text(context.l10n.noResults))
                            : ListView.separated(
                                itemCount: centers.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 12.h),
                                itemBuilder: (context, index) {
                                  final center = centers[index];
                                  return _buildLocationCard(
                                    context,
                                    ref,
                                    icon: LucideIcons.recycle,
                                    title: center.name,
                                    distance: center.address,
                                    iconColor: const Color(0xFF10B981),
                                    onSelect: () {
                                      ref
                                          .read(
                                            recycleViewModelProvider.notifier,
                                          )
                                          .setCenter(center.id, center.name);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RecycleCargoScreen(),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                      ),
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

  Widget _buildLocationCard(
    BuildContext context,
    WidgetRef ref, {
    required IconData icon,
    required String title,
    required String distance,
    required Color iconColor,
    required VoidCallback onSelect,
  }) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.surfaceDark
              : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: context.theme.dividerColor.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: iconColor, size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: context.isDarkMode
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    distance,
                    style: TextStyle(
                      color: context.isDarkMode
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Seç',
              style: TextStyle(
                color: const Color(0xFF2DD4BF),
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
