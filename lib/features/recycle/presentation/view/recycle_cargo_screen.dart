import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_success_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_state.dart';
import 'package:mobile_flutter/features/recycle/presentation/viewmodel/recycle_view_model.dart';
import 'package:mobile_flutter/features/recycle/presentation/widgets/recycle_header.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

const List<String> _kWasteTypes = ['electronic', 'battery', 'cable', 'other'];

String _wasteTypeLabel(String type) {
  switch (type) {
    case 'electronic':
      return 'Elektronik Cihaz';
    case 'battery':
      return 'Pil / Batarya';
    case 'cable':
      return 'Kablo';
    default:
      return 'Diğer';
  }
}

class RecycleCargoScreen extends ConsumerStatefulWidget {
  const RecycleCargoScreen({super.key});

  @override
  ConsumerState<RecycleCargoScreen> createState() => _RecycleCargoScreenState();
}

class _RecycleCargoScreenState extends ConsumerState<RecycleCargoScreen> {
  late final TextEditingController _weightController;

  @override
  void initState() {
    super.initState();
    final initialWeight = ref.read(recycleViewModelProvider).weightKg;
    _weightController = TextEditingController(text: initialWeight.toString());
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recycleState = ref.watch(recycleViewModelProvider);
    final notifier = ref.read(recycleViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: context.isDarkMode
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            const RecycleHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      'Kargo QR Kodu',
                      style: TextStyle(
                        color: context.isDarkMode
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // QR Code Placeholder (Always dark/black - QR readability, not theme related)
                    Container(
                      width: 200.w,
                      height: 200.w,
                      margin: EdgeInsets.only(bottom: 24.h),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.qr_code,
                          color: Colors.white,
                          size: 100.sp,
                        ),
                      ),
                    ),

                    // Center Selection Info
                    if (recycleState.selectedCenterName != null) ...[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12.w),
                        margin: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            const Icon(LucideIcons.mapPin, color: Color(0xFF10B981)),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                recycleState.selectedCenterName!,
                                style: TextStyle(
                                  color: context.isDarkMode
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    // Waste Type Selection
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Atık Türü',
                        style: TextStyle(
                          color: context.isDarkMode
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: context.isDarkMode
                            ? AppColors.surfaceDark
                            : AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: recycleState.wasteType,
                          isExpanded: true,
                          items: _kWasteTypes
                              .map(
                                (type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(_wasteTypeLabel(type)),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) notifier.setWasteType(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Weight Input
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ağırlık (kg)',
                        style: TextStyle(
                          color: context.isDarkMode
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      decoration: BoxDecoration(
                        color: context.isDarkMode
                            ? AppColors.surfaceDark
                            : AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: TextField(
                        controller: _weightController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        style: TextStyle(
                          color: context.isDarkMode
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                        decoration: InputDecoration(
                          hintText: '1.0',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16.w),
                        ),
                        onChanged: (value) {
                          final parsed = double.tryParse(value);
                          if (parsed != null) notifier.setWeight(parsed);
                        },
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Transport Mode Selection
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Taşıma Yöntemi Seçin',
                        style: TextStyle(
                          color: context.isDarkMode
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    _buildTransportOption(
                      context,
                      mode: TransportMode.standard,
                      selectedMode: recycleState.selectedMode,
                      title: 'Standart Kurye',
                      subtitle: 'Normal puan kazanımı',
                      icon: LucideIcons.truck,
                      onTap: () =>
                          notifier.setTransportMode(TransportMode.standard),
                    ),
                    SizedBox(height: 12.h),
                    _buildTransportOption(
                      context,
                      mode: TransportMode.electric,
                      selectedMode: recycleState.selectedMode,
                      title: 'Elektrikli / Yeşil Kurye',
                      subtitle: '%50 Daha Fazla Eko-Puan! 🌱',
                      icon: LucideIcons.zap,
                      isGreen: true,
                      onTap: () =>
                          notifier.setTransportMode(TransportMode.electric),
                    ),

                    SizedBox(height: 32.h),

                    // Cargo Info Card
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: context.isDarkMode
                            ? AppColors.surfaceDark
                            : AppColors.surfaceLight,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: context.theme.dividerColor.withOpacity(0.05),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Kargo Bilgileri',
                            style: TextStyle(
                              color: const Color(0xFF3B82F6),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          _buildInfoRow(
                            context,
                            'Atık Türü:',
                            _wasteTypeLabel(recycleState.wasteType),
                          ),
                          SizedBox(height: 12.h),
                          _buildInfoRow(
                            context,
                            'Ağırlık:',
                            '${recycleState.weightKg.toStringAsFixed(1)} kg',
                          ),
                          SizedBox(height: 12.h),
                          _buildInfoRow(
                            context,
                            'Tahmini Kazanılacak Puan:',
                            '${recycleState.estimatedPoints.toStringAsFixed(0)} Puan',
                            isHighlight: true,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // Success Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: recycleState.isLoading
                            ? null
                            : () async {
                                final userId = ref
                                    .read(authViewModelProvider)
                                    .valueOrNull
                                    ?.id;
                                if (userId == null) return;
                                final success = await notifier.submitRecycle(
                                  userId,
                                  recycleState.selectedCenterId,
                                  recycleState.wasteType,
                                  recycleState.weightKg,
                                );
                                if (success && mounted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RecycleSuccessScreen(),
                                    ),
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF10B981), // Green
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: recycleState.isLoading
                            ? SizedBox(
                                height: 20.h,
                                width: 20.h,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Teslim Edildi',
                                style: TextStyle(
                                  color: Colors.white,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransportOption(
    BuildContext context, {
    required TransportMode mode,
    required TransportMode selectedMode,
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    bool isGreen = false,
  }) {
    final bool isSelected = mode == selectedMode;
    final Color activeColor = isGreen
        ? const Color(0xFF10B981)
        : const Color(0xFF3B82F6);
    final Color secondaryTextColor = context.isDarkMode
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;
    final Color borderColor = isSelected
        ? activeColor
        : context.theme.dividerColor.withOpacity(0.1);
    final Color iconColor = isSelected ? activeColor : secondaryTextColor;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? activeColor.withOpacity(0.1)
              : (context.isDarkMode
                    ? AppColors.surfaceDark
                    : AppColors.surfaceLight),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24.sp),
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
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isGreen
                          ? const Color(0xFF10B981)
                          : secondaryTextColor,
                      fontSize: 12.sp,
                      fontWeight: isGreen ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(LucideIcons.checkCircle, color: activeColor, size: 20.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value, {
    bool isHighlight = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: context.isDarkMode
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
            fontSize: 14.sp,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isHighlight
                ? const Color(0xFF10B981)
                : (context.isDarkMode
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight),
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
