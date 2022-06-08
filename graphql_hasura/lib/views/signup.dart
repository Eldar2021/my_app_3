import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/utils.dart';
import '../services/auth_servivce.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                          if (await hasuraAuth.signup(
                            emailController.text,
                            passwordController.text,
                          )) {
                            UtilFs.showToast("SignUp Successful", context);
                            Navigator.pop(context);
                          } else {
                            FocusScope.of(context).requestFocus(FocusNode());
                            UtilFs.showToast("SignUp Failed", context);
                          }
                          setState(() {
                            busyView = false;
                          });
                        }
                      },
                      text: "SignUp",
                    ),
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
