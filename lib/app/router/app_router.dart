import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/features/auth/presentation/view/login_screen.dart';
import 'package:mobile_flutter/features/auth/presentation/view/register_screen.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/contact/presentation/view/contact_screen.dart';
import 'package:mobile_flutter/features/discover/presentation/view/discover_screen.dart';
import 'package:mobile_flutter/features/home/presentation/view/home_content.dart';
import 'package:mobile_flutter/features/map/presentation/view/map_screen.dart';
import 'package:mobile_flutter/app/navigation/nav_bar.dart';
import 'package:mobile_flutter/features/notifications/presentation/view/notifications_screen.dart';
import 'package:mobile_flutter/features/profile/presentation/view/profile_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_action_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_cargo_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_map_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_success_screen.dart';
import 'package:mobile_flutter/features/repair/presentation/view/repair_screen.dart';
import 'package:mobile_flutter/features/rewards/presentation/view/rewards_screen.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/create_listing_screen.dart';
import 'package:mobile_flutter/features/sell/presentation/view/sell_screen.dart';
import 'package:mobile_flutter/features/settings/presentation/view/settings_screen.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final authAsync = ref.watch(authViewModelProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.login,
    redirect: (context, state) {
      // Session is still being restored (checking the persisted cookie) —
      // don't redirect yet, avoids a flash to login before /me resolves.
      if (authAsync.isLoading) return null;

      final isLoggedIn = authAsync.valueOrNull != null;
      final isAuthRoute =
          state.matchedLocation == Routes.login ||
          state.matchedLocation == Routes.register;

      if (!isLoggedIn && !isAuthRoute) return Routes.login;
      if (isLoggedIn && isAuthRoute) return Routes.home;
      return null;
    },
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
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.contact,
        builder: (context, state) => const ContactScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.discover,
        builder: (context, state) => const DiscoverScreen(),
      ),
    ],
  );
});
