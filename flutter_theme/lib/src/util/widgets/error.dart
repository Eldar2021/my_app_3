import 'package:flutter/material.dart';

class Error extends Center {
  const Error({
    Key? key,
    required this.massage,
  }) : super(key: key);
  final String massage;
  @override
  Widget? get child => Text(massage);
}
