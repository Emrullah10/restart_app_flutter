/// Route names and paths
class Routes {
  static const String home = '/';
  static const String discover = '/discover';
  static const String map = '/map';
  static const String rewards = '/rewards';
  static const String sell = '/sell';
  static const String repair = '/repair';
  static const String profile = '/profile';
  static const String notifications = '/notifications';
  static const String settings = '/settings';

  // Auth routes
  static const String login = '/login';
  static const String register = '/register';

  // Recycle flow routes
  static const String recycle = '/recycle';
  static const String recycleAction = 'action'; // Sub-route
  static const String recycleMap = 'map'; // Sub-route
  static const String recycleCargo = 'cargo'; // Sub-route
  static const String recycleSuccess = 'success'; // Sub-route

  // Sell flow routes
  static const String createListing = 'create-listing'; // Sub-route
}

enum AppRoute { home, map, rewards, sell, profile, notifications, recycle }
