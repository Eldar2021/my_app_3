import 'package:flutter/material.dart';

class PasswordText extends StatefulWidget {
  const PasswordText({this.controller, super.key});

  final TextEditingController? controller;

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  bool visible = false;

  void change() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('rebuild PasswordText');
    return TextFormField(
      obscureText: visible,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          onPressed: change,
          icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      validator: (val) => (val?.length ?? 0) < 6 ? 'heey' : null,
    );
  }
}
