import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';

/// Persistent shell: tab order is Map | Recycle | Home | Sell | Rewards (branch indices 0..4).
class NavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const NavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: RsBottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: (i) => navigationShell.goBranch(i, initialLocation: i == navigationShell.currentIndex),
      ),
    );
  }
}
