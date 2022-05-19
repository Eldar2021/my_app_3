class DownLoadFile {
  static DownLoadFile? _instance;
  static DownLoadFile get instance {
    _instance ??= DownLoadFile._init();
    return _instance!;
  }

  DownLoadFile._init();
}
