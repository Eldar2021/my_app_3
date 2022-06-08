import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  SharedPreferenceService();

  late final SharedPreferences _prefs;

  Future<bool> getSharedPreferencesInstance() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future setToken(String token) async {
    await _prefs.setString('token', token);
  }

  Future clearToken() async {
    await _prefs.clear();
  }

  Future<String?> get token async => _prefs.getString('token');
}

SharedPreferenceService sharedPreferenceService = SharedPreferenceService();
