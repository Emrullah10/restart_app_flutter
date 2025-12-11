import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/presentation/auth/login_screen.dart';
import 'package:mobile_flutter/presentation/auth/register_screen.dart';
import 'package:mobile_flutter/presentation/home/home_screen.dart';
import 'package:mobile_flutter/presentation/home/widgets/home_content.dart';
import 'package:mobile_flutter/presentation/map/map_screen.dart';
import 'package:mobile_flutter/presentation/notifications/notifications_screen.dart';
import 'package:mobile_flutter/presentation/profile/profile_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_action_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_cargo_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_map_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_screen.dart';
import 'package:mobile_flutter/presentation/recycle/recycle_success_screen.dart';
import 'package:mobile_flutter/presentation/rewards/rewards_screen.dart';
import 'package:mobile_flutter/presentation/sell/sell_screen.dart';
import 'package:mobile_flutter/presentation/sell/widgets/create_listing_screen.dart';
import 'package:mobile_flutter/presentation/settings/settings_screen.dart';
import 'package:mobile_flutter/routes/routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.login,
    routes: [
      // Shell Route for Bottom Navigation Persistence
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          // Pass the current location to HomeScreen to manage index if needed,
          // or HomeScreen can deduce logic.
          // Actually, standard way is to have a ScaffoldWithNavBar here.
          // Since HomeScreen contains the Scaffold and BottomNavBar, we can use it as the wrapper.
          // But HomeScreen currently HAS the IndexedStack logic which we want to replace.
          return HomeScreen(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.home,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeContent()),
          ),
          GoRoute(
            path: Routes.map,
            pageBuilder: (context, state) {
              final filter = state.uri.queryParameters['filter'];
              return NoTransitionPage(child: MapScreen(filter: filter));
            },
          ),
          GoRoute(
            path: Routes.rewards,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: RewardsScreen()),
          ),
          GoRoute(
            path: Routes.sell,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SellScreen()),
            routes: [
              GoRoute(
                path: Routes.createListing,
                parentNavigatorKey: rootNavigatorKey, // Hide bottom bar
                builder: (context, state) => const CreateListingScreen(),
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

      // Recycle Flow Routes
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: Routes.recycle,
        builder: (context, state) => const RecycleScreen(),
        routes: [
          GoRoute(
            path: Routes.recycleAction,
            builder: (context, state) => const RecycleActionScreen(),
          ),
          GoRoute(
            path: Routes.recycleMap,
            builder: (context, state) => const RecycleMapScreen(),
          ),
          GoRoute(
            path: Routes.recycleCargo,
            builder: (context, state) => const RecycleCargoScreen(),
          ),
          GoRoute(
            path: Routes.recycleSuccess,
            builder: (context, state) => const RecycleSuccessScreen(),
          ),
        ],
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
    ],
  );
});
