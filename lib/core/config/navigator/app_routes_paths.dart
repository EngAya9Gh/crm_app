abstract class AppRoutesPaths {
  static final _AppInit init = _AppInit();
  static final _Auth auth = _Auth();

  static const String notAllowed = '/not-allowed';
  static const String home = '/home';
}

class _AppInit {
  final String splashScreen = '/';
  final String updateApp = '/update-app';
}

class _Auth {
  final String login = '/login';
  final String otp = 'otp';
}
