import 'dart:convert';
import 'package:http/http.dart' as http;

class HasuraAuth {
  Future<String?> login(String username, String password) async {
    Map credentials = {
      "username": username,
      "password": password,
    };
    try {
      http.Response response = await http.post(
        Uri.parse("https://hasura.io/learn/auth/login"),
        headers: {"content-type": "application/json"},
        body: jsonEncode(credentials),
      );
      final token = jsonDecode(response.body)["token"];
      return token;
    } catch (e) {
      throw Exception();
    }
  }

  Future<bool> signup(String username, String password) async {
    Map credentials = {
      "username": username,
      "password": password,
    };

    try {
      http.Response response = await http.post(
        Uri.parse("https://hasura.io/learn/auth/signup"),
        headers: {"content-type": "application/json"},
        body: jsonEncode(credentials),
      );

      final success = jsonDecode(response.body)["id"] != null;
      return success;
    } catch (e) {
      throw Exception();
    }
  }
}

HasuraAuth hasuraAuth = HasuraAuth();
