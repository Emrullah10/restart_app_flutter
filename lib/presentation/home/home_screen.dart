import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/routes/routes.dart';
import 'package:mobile_flutter/utils/constants/app_colors.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Index logic is now derived from the current location or handled by GoRouter's shell/stateful shell.
  // For standard ShellRoute, we can manually check location to highlight tab.

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.map)) return 1;
    if (location.startsWith(Routes.rewards)) return 2;
    if (location.startsWith(Routes.sell)) return 3;
    if (location == Routes.home) return 0;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(Routes.home);
        break;
      case 1:
        context.go(Routes.map);
        break;
      case 2:
        context.go(Routes.rewards);
        break;
      case 3:
        context.go(Routes.sell);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            context.theme.scaffoldBackgroundColor, // bg-gray-900 or light bg
        body: widget.child, // The body is now the child from ShellRoute
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: context.theme.bottomNavigationBarTheme.backgroundColor,
            border: Border(
              top: BorderSide(
                color: context.theme.dividerColor.withOpacity(0.1),
                width: 1.w,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, LucideIcons.home, context.l10n.navHome),
                _buildNavItem(1, LucideIcons.map, context.l10n.navMap),
                _buildCenterFab(),
                _buildNavItem(2, LucideIcons.medal, context.l10n.navRewards),
                _buildNavItem(3, LucideIcons.tag, context.l10n.navSell),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = _calculateSelectedIndex(context) == index;
    final Color selectedColor =
        context.theme.bottomNavigationBarTheme.selectedItemColor ??
        AppColors.primary;
    final Color unselectedColor =
        context.theme.bottomNavigationBarTheme.unselectedItemColor ??
        Colors.grey;

    return GestureDetector(
      onTap: () => _onItemTapped(index, context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? selectedColor : unselectedColor,
            size: 24.sp,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? selectedColor : unselectedColor,
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterFab() {
    return GestureDetector(
      // Center FAB behavior - perhaps navigate to Recycle?
      // For now, let's keep it performing the 'Recycle Flow' initiation if that was the intent,
      // or as a shortcut. Previous code didn't wire it to anything in nav bar logic except dummy.
      // Let's wire it to Recycle screen as a meaningful action.
      onTap: () => context.push(Routes.recycle),
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          color: context.theme.brightness == Brightness.dark
              ? Colors.white.withOpacity(0.1)
              : AppColors.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.add,
          color: context.theme.brightness == Brightness.dark
              ? Colors.white
              : AppColors.primary,
          size: 28.sp,
        ),
      ),
    );
  }
}
