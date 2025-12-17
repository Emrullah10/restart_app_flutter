import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class RecycleHeader extends StatelessWidget {
  const RecycleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button removed as this is a main tab
          SizedBox(width: 48.w),
          Text(
            context.l10n.recycleTitle,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          // Empty SizedBox to balance the row if needed, or an action button if design changes.
          // Design shows just back and title centered/balanced.
          SizedBox(width: 48.w),
        ],
      ),
    );
  }
}
