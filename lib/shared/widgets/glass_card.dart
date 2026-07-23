import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              color: const Color(0xFF111827).withOpacity(0.4), // bg-gray-900/40
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
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
