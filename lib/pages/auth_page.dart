import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ydm_sdn_project/pages/homepage.dart';
// import 'package:ydm_sdn_project/pages/login_page.dart';
// import 'package:ydm_sdn_project/pages/register_page.dart';
import 'package:ydm_sdn_project/pages/login_or_register_page.dart';
=======
import 'package:modernlogintute/pages/homepage.dart';
// import 'package:modernlogintute/pages/login_page.dart';
// import 'package:modernlogintute/pages/register_page.dart';
import 'package:modernlogintute/pages/login_or_register_page.dart';
>>>>>>> 8780d5b6590d5d159d5adc53799c8b63562e2060

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // user has logged in or not
            return HomePage();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
