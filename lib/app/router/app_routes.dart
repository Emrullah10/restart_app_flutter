/// Route paths. Everything except auth lives inside the bottom-nav shell.
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
  static const String settingsPassword = '/settings/password';
  static const String settingsNotifications = '/settings/notifications';
  static String legal(String kind) => '/legal/$kind';
  static const String contact = '/contact';

  static const String login = '/login';
  static const String register = '/register';

  static const String recycle = '/recycle';
  static const String recycleDetails = '/recycle/details';
  static const String recycleCourier = '/recycle/courier';
  static const String recycleSuccess = '/recycle/success';

  static const String createListing = '/sell/create';
}
