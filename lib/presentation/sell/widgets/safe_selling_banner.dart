import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';
import 'package:mobile_flutter/utils/extensions/padding_extensions.dart';

class SafeSellingBanner extends StatelessWidget {
  const SafeSellingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: [24, 24].horizantalAndVerticalP,
      padding: 16.allP,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF10B981).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              LucideIcons.shieldCheck,
              color: const Color(0xFF10B981),
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.safeSellingTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  context.l10n.safeSellingDesc,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.sp,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Icon(LucideIcons.chevronRight, color: Colors.grey[500], size: 20.sp),
        ],
      ),
    );
  }
}
