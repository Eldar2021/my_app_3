import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKey {
  static ApiKey? _instance;
  static ApiKey get instance {
    _instance ??= ApiKey._init();
    return _instance!;
  }

  ApiKey._init();

  final String googleMapApiKey = dotenv.env['googleMapApiKey'] ?? '';
}
