import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 16.0,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: padding ?? EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color:
                  (context.isDarkMode
                          ? AppColors.backgroundDark
                          : AppColors.surfaceLight)
                      .withOpacity(context.isDarkMode ? 0.4 : 0.7),
              border: Border.all(
                color: context.theme.dividerColor.withOpacity(0.1),
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
