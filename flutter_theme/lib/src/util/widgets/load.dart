import 'package:flutter/material.dart';

class Load extends Center {
  const Load({Key? key}) : super(key: key);
  @override
  Widget? get child => const CircularProgressIndicator();
}
