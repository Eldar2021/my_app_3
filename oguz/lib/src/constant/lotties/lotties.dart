class AppLottie {
  static AppLottie? _instance;
  static AppLottie get instance {
    _instance ??= AppLottie._init();
    return _instance!;
  }

  AppLottie._init();

  final String desConnected = 'assets/lottie/disconnected.json';
}
