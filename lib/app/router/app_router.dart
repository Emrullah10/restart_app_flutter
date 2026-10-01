import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_flutter/app/navigation/nav_bar.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/features/auth/presentation/view/login_screen.dart';
import 'package:mobile_flutter/features/auth/presentation/view/register_screen.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/contact/presentation/view/contact_screen.dart';
import 'package:mobile_flutter/features/discover/presentation/view/discover_screen.dart';
import 'package:mobile_flutter/features/home/presentation/view/home_content.dart';
import 'package:mobile_flutter/features/map/presentation/view/map_screen.dart';
import 'package:mobile_flutter/features/notifications/presentation/view/notifications_screen.dart';
import 'package:mobile_flutter/features/profile/presentation/view/profile_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_action_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_cargo_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_screen.dart';
import 'package:mobile_flutter/features/recycle/presentation/view/recycle_success_screen.dart';
import 'package:mobile_flutter/features/repair/presentation/view/repair_screen.dart';
import 'package:mobile_flutter/features/rewards/presentation/view/rewards_screen.dart';
import 'package:mobile_flutter/features/sell/presentation/view/create_listing/create_listing_screen.dart';
import 'package:mobile_flutter/features/sell/presentation/view/sell_screen.dart';
import 'package:mobile_flutter/features/settings/presentation/view/settings_screen.dart';

Page<void> _tab(Widget child) => NoTransitionPage(child: child);

final goRouterProvider = Provider<GoRouter>((ref) {
  final authAsync = ref.watch(authViewModelProvider);

  return GoRouter(
    initialLocation: Routes.login,
    redirect: (context, state) {
      // Session restore in progress — don't flash the login screen.
      if (authAsync.isLoading) return null;
      final loggedIn = authAsync.valueOrNull != null;
      final loc = state.matchedLocation;
      final authRoute = loc == Routes.login || loc == Routes.register;
      if (!loggedIn && !authRoute) return Routes.login;
      if (loggedIn && authRoute) return Routes.home;
      if (loc == '/create-listing') return Routes.createListing;
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => NavBar(navigationShell: shell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: Routes.map, pageBuilder: (c, s) => _tab(MapScreen(filter: s.uri.queryParameters['filter']))),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: Routes.recycle, pageBuilder: (c, s) => _tab(const RecycleScreen()), routes: [
              GoRoute(path: 'details', pageBuilder: (c, s) => _tab(const RecycleActionScreen())),
              GoRoute(path: 'courier', pageBuilder: (c, s) => _tab(const RecycleCargoScreen())),
              GoRoute(path: 'success', pageBuilder: (c, s) => _tab(const RecycleSuccessScreen())),
            ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: Routes.home, pageBuilder: (c, s) => _tab(const HomeContent()), routes: [
              GoRoute(path: 'discover', pageBuilder: (c, s) => _tab(const DiscoverScreen())),
              GoRoute(path: 'repair', pageBuilder: (c, s) => _tab(const RepairScreen())),
              GoRoute(path: 'profile', pageBuilder: (c, s) => _tab(const ProfileScreen())),
              GoRoute(path: 'notifications', pageBuilder: (c, s) => _tab(const NotificationsScreen())),
              GoRoute(path: 'settings', pageBuilder: (c, s) => _tab(const SettingsScreen())),
              GoRoute(path: 'contact', pageBuilder: (c, s) => _tab(const ContactScreen())),
            ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: Routes.sell, pageBuilder: (c, s) => _tab(const SellScreen()), routes: [
              GoRoute(path: 'create', pageBuilder: (c, s) => _tab(const CreateListingScreen())),
            ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: Routes.rewards, pageBuilder: (c, s) => _tab(const RewardsScreen())),
          ]),
        ],
      ),
      GoRoute(path: Routes.login, builder: (c, s) => const LoginScreen()),
      GoRoute(path: Routes.register, builder: (c, s) => const RegisterScreen()),
    ],
  );
});
