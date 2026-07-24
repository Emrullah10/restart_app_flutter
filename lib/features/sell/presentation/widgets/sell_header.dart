import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';
import 'package:mobile_flutter/shared/extensions/padding_extensions.dart';

class SellHeader extends StatelessWidget {
  const SellHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: [16, 12].horizantalAndVerticalP,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button removed as this is now a main tab
          SizedBox(
            width: 48.w,
          ), // Placeholder to keep title centered if needed, or remove to center naturally
          // Actually, MainAxisAlignment.spaceBetween with 3 items centers the middle one if outer two are equal width.
          // Let's use a SizedBox of same size as right icon to balance it.
          Text(
            context.l10n.sellTitle,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(
              LucideIcons.moreVertical,
              color: context.theme.iconTheme.color,
              size: 24.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
