import 'package:flutter/services.dart' show rootBundle;

Future<String> fixture(String name) async {
  final jsonText = await rootBundle.loadString('assets/fake_api/$name.json');
  // final res = json.encode(jsonText);

  return jsonText;
}
