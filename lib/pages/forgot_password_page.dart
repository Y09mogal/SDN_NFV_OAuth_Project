import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ydm_sdn_project/components/my_button.dart';
import 'package:ydm_sdn_project/components/my_textfield.dart';
=======
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
>>>>>>> 8780d5b6590d5d159d5adc53799c8b63562e2060

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Password reset link sent!"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.grey[100], // Light grey app bar
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Enter your registered email ID to get password reset link",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          MyTextField(
            controller: _emailController,
            hintText: "Email",
            obscureText: false,
            backgroundColor: Colors.white, // White text field background
          ),
          const SizedBox(height: 30),
          MyButton(
            onTap: () {
              passwordReset(_emailController.text.trim());
            },
            text: "Reset Password",
            backgroundColor: Colors.pink, // Pink button background
          ),
        ],
      ),
    );
  }
}
