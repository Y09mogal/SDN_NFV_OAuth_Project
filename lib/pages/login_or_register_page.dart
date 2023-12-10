import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ydm_sdn_project/pages/login_page.dart';
import 'package:ydm_sdn_project/pages/register_page.dart';
=======
import 'package:modernlogintute/pages/login_page.dart';
import 'package:modernlogintute/pages/register_page.dart';
>>>>>>> 8780d5b6590d5d159d5adc53799c8b63562e2060

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
