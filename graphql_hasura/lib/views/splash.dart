import 'package:flutter/material.dart';

import '../services/shared_preferences_service.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  initMethod(context) async {
    await sharedPreferenceService.getSharedPreferencesInstance();
    final token = await sharedPreferenceService.token;
    if (token == null || token == "") {
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => initMethod(context));
    
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
