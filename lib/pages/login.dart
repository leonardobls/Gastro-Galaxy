import 'package:flutter/material.dart';
import 'package:gastro_galaxy/components/bottom_bar.dart';
import 'package:gastro_galaxy/config/app_styles.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.primaryColor,
        title: const Text("Login Page"),
      ),
      body: Container(),
    );
  }
}
