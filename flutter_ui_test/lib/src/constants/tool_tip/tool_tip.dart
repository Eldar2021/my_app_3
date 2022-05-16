class AppToolTip {
  static AppToolTip? _instance;
  static AppToolTip get instance {
    _instance ??= AppToolTip._init();
    return _instance!;
  }

  AppToolTip._init();

  final addButton = 'Add-Button';
}
