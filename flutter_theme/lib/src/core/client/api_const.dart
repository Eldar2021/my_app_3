class ApiConst {
  static ApiConst? _instance;
  static ApiConst get instance {
    _instance ??= ApiConst._init();
    return _instance!;
  }

  ApiConst._init();

  final String scheme = 'https';
  final String host = 'reqres.in';
  
  final String users = '/api/users?page=1';
}
