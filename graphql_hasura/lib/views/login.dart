import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/utils.dart';
import '../services/auth_servivce.dart';
import '../services/shared_preferences_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _token = "";
  bool busyView = false;

  @override
  Widget build(BuildContext context) {
    if (!busyView) {
      return Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  "ToDo App",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 38),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value ?? '')) {
                            return 'Enter Valid Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(labelText: "Password"),
                        validator: (value) {
                          return (value?.length ?? 0) < 4
                              ? "Password must be at least 4 characters long"
                              : null;
                        },
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    CustomButton(
                      width: 180,
                      height: 50,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            busyView = true;
                          });
                          _token = await hasuraAuth.login(
                            emailController.text,
                            passwordController.text,
                          );
                          if (_token != null) {
                            // ignore: use_build_context_synchronously
                            UtilFs.showToast("Login Successful", context);
                            await sharedPreferenceService.setToken(_token!);
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(context, "/dashboard");
                          } else {
                            setState(() {
                              busyView = false;
                            });
                            // ignore: use_build_context_synchronously
                            UtilFs.showToast("Login Failed", context);
                            // ignore: use_build_context_synchronously
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                        }
                      },
                      text: "Login",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: const SizedBox(
                          height: 20,
                          child: Text(
                            "New? Sign Up",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
