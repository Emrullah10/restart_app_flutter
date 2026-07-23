import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class NavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavBar({super.key, required this.navigationShell});

  void _onItemTapped(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Current Order: Map | Recycle | Home | Sell | Rewards
    final int currentIndex = navigationShell.currentIndex;
    final bool isHome = currentIndex == 2;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      extendBody: true, // Crucial for glassmorphism
      body: navigationShell,
      floatingActionButton: isHome
          ? FloatingActionButton(
              heroTag: 'home_fab',
              onPressed: () => context.push(Routes.createListing),
              backgroundColor: AppColors.primary,
              elevation: 4,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: context.theme.dividerColor.withOpacity(0.1),
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(
                    context,
                    0,
                    LucideIcons.map,
                    context.l10n.navMap,
                  ),
                  _buildNavItem(
                    context,
                    1,
                    LucideIcons.recycle,
                    context.l10n.recycleTitle,
                  ),
                  _buildNavItem(
                    context,
                    2,
                    LucideIcons.home,
                    context.l10n.navHome,
                  ),
                  _buildNavItem(
                    context,
                    3,
                    LucideIcons.tag,
                    context.l10n.navSell,
                  ),
                  _buildNavItem(
                    context,
                    4,
                    LucideIcons.medal,
                    context.l10n.navRewards,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
  ) {
    final bool isSelected = navigationShell.currentIndex == index;
    final Color selectedColor =
        context.theme.bottomNavigationBarTheme.selectedItemColor ??
        AppColors.primary;
    final Color unselectedColor =
        context.theme.bottomNavigationBarTheme.unselectedItemColor ??
        Colors.grey;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index, context),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutBack,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? selectedColor.withOpacity(0.1)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: isSelected ? selectedColor : unselectedColor,
                  size: 24.sp,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: isSelected
                  ? Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: selectedColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
