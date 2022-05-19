class AppString {
  static AppString? _instance;
  static AppString get instance {
    _instance ??= AppString._init();
    return _instance!;
  }

  AppString._init();

  final String o = 'Oguzhan';
}
