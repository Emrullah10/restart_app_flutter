import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/presentation/auth/login_screen.dart';
import 'package:mobile_flutter/presentation/auth/register_screen.dart';
import 'package:mobile_flutter/presentation/home/widgets/home_content.dart';
import 'package:mobile_flutter/presentation/map/map_screen.dart';
import 'package:mobile_flutter/presentation/navigation/nav_bar.dart';
import 'package:mobile_flutter/presentation/notifications/notifications_screen.dart';
import 'package:mobile_flutter/presentation/profile/profile_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_action_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_cargo_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_map_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_success_screen.dart';
import 'package:mobile_flutter/presentation/repair/repair_screen.dart';
import 'package:mobile_flutter/presentation/rewards/rewards_screen.dart';
import 'package:mobile_flutter/presentation/sell/create_listing/create_listing_screen.dart';
import 'package:mobile_flutter/presentation/sell/sell_screen.dart';
import 'package:mobile_flutter/presentation/settings/settings_screen.dart';
import 'package:mobile_flutter/routes/routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.login,
    routes: [
      // Shell Route for Bottom Navigation Persistence
      // Stateful Shell Route for Persistent Bottom Navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return NavBar(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Map
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.map,
                pageBuilder: (context, state) {
                  final filter = state.uri.queryParameters['filter'];
                  return NoTransitionPage(child: MapScreen(filter: filter));
                },
              ),
            ],
          ),

          // Branch 1: Recycle
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.recycle,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: RecycleScreen()),
                routes: [
                  GoRoute(
                    path: Routes.recycleAction,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const RecycleActionScreen(),
                  ),
                  GoRoute(
                    path: Routes.recycleMap,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const RecycleMapScreen(),
                  ),
                  GoRoute(
                    path: Routes.recycleCargo,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const RecycleCargoScreen(),
                  ),
                  GoRoute(
                    path: Routes.recycleSuccess,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => const RecycleSuccessScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Branch 2: Home (Initial)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeContent()),
              ),
            ],
          ),

          // Branch 3: Sell
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.sell,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SellScreen()),
                routes: [],
              ),
            ],
          ),

          // Branch 4: Rewards
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.rewards,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: RewardsScreen()),
              ),
            ],
          ),
        ],
      ),

      // Standalone Routes (Outside Shell/BottomBar)
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),

      // Auth Routes
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey, // Overlay on top of bottom nav
        path: Routes.repair,
        builder: (context, state) => const RepairScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.createListing,
        builder: (context, state) => const CreateListingScreen(),
      ),
    ],
  );
});
