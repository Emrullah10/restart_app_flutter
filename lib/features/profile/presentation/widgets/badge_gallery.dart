import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/profile/presentation/viewmodel/gamification_view_model.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class BadgeGallery extends ConsumerWidget {
  const BadgeGallery({super.key});

  IconData _getIconForBadge(String? iconName) {
    switch (iconName) {
      case 'star':
        return Icons.star;
      case 'wrench':
        return LucideIcons.wrench;
      case 'recycle':
        return LucideIcons.recycle;
      case 'flame':
        return LucideIcons.flame;
      case 'heart':
        return Icons.favorite;
      case 'award':
        return LucideIcons.award;
      case 'leaf':
        return LucideIcons.leaf;
      case 'trophy':
        return LucideIcons.trophy;
      default:
        return LucideIcons.award;
    }
  }

  Color _getColorForBadge(String? colorHex) {
    if (colorHex == null) return const Color(0xFF10B981);
    try {
      return Color(int.parse(colorHex.replaceFirst('#', '0xFF')));
    } catch (_) {
      return const Color(0xFF10B981);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badgesAsync = ref.watch(badgesViewModelProvider);
    final badges = badgesAsync.valueOrNull ?? const [];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.badgeGalleryTitle,
            style: TextStyle(
              color: context.isDarkMode
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          if (badgesAsync.isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF22C55E)),
            )
          else if (badges.isEmpty)
            Text(
              'Henüz rozet yok',
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontSize: 14.sp,
              ),
            )
          else
            Wrap(
              spacing: 16.w,
              runSpacing: 24.h,
              children: badges.take(6).map((badge) {
                final isUnlocked = badge.isUnlocked;
                final name = badge.name;
                final icon = badge.icon;
                final color = badge.color;

                return _buildBadge(
                  context,
                  icon: isUnlocked ? _getIconForBadge(icon) : LucideIcons.lock,
                  color: isUnlocked
                      ? _getColorForBadge(color)
                      : (context.isDarkMode
                            ? AppColors.borderDark
                            : AppColors.borderLight),
                  label: isUnlocked ? name : context.l10n.badgeLocked,
                  isLocked: !isUnlocked,
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildBadge(
    BuildContext context, {
    IconData? icon,
    IconData? customIcon,
    required Color color,
    required String label,
    bool isLocked = false,
  }) {
    final Color lockedTextColor = context.isDarkMode
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 70.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: isLocked
                ? []
                : [
                    BoxShadow(
                      color: color.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Icon(
            customIcon ?? icon,
            color: isLocked ? lockedTextColor : Colors.white,
            size: 32.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isLocked
                ? lockedTextColor
                : (context.isDarkMode
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight),
            fontSize: 12.sp,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

// Temporary workaround if Heart icon missing in Lucide
class MyCustomIcons {
  static const IconData heart = Icons.favorite;
}
