import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
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
          // Balances the right icon so the title stays centered.
          SizedBox(width: 48.w),
          Text(
            context.l10n.sellTitle,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(
              LucideIcons.compass,
              color: context.theme.iconTheme.color,
              size: 24.sp,
            ),
            onPressed: () => context.push(Routes.discover),
          ),
        ],
      ),
    );
  }
}
