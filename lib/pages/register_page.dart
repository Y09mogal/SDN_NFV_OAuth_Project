import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';
import 'package:modernlogintute/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final _firstnmController = TextEditingController();
  final _lastnmController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstnmController.dispose();
    _lastnmController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future addUserDetails(String uid, String first_name, String last_name, String em_id) async {
    await FirebaseFirestore.instance.collection('users').add({
      'uid': uid,
      'first name': first_name,
      'last name': last_name,
      'email': em_id,
    });
  }

  // sign user up method
  Future signUserUp() async {
    //loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text.trim() == confirmPasswordController.text.trim()) {
        // if password matches or not
        //creating user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        addUserDetails(
          FirebaseAuth.instance.currentUser!.uid,
          _firstnmController.text.trim(),
          _lastnmController.text.trim(),
          emailController.text.trim()
        );
      } 
      else {
        // if password doesn't match
        showErrorMessage("Passwords don't match! Try Again!");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // logo
                const Icon(
                  Icons.flight_takeoff,
                  size: 100,
                  color: Color.fromRGBO(244, 67, 54, 1),
                ),

                const SizedBox(height: 25),

                // hello message
                const Text(
                  'Create your account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 128, 126, 126),
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                // first name textfield
                MyTextField(
                  controller: _firstnmController,
                  hintText: 'First Name',
                  obscureText: false,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 8),

                // last name textfield
                MyTextField(
                  controller: _lastnmController,
                  hintText: 'Last Name',
                  obscureText: false,
                  backgroundColor: Colors.white,
                ),

                const SizedBox(height: 8),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  backgroundColor: Colors.white
                ),

                const SizedBox(height: 8),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  backgroundColor: Colors.white
                ),

                const SizedBox(height: 8),

                // confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  backgroundColor: Colors.white
                ),

                const SizedBox(height: 20),

                // sign up button
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                  backgroundColor: Colors.pink
                ),

                const SizedBox(height: 40),

                // or continue with
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Color.fromARGB(255, 91, 90, 90)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 114, 113, 113),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // google + facebook sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'lib/images/google.png'),

                    const SizedBox(width: 25),

                    // facebook button
                    SquareTile(
                        onTap: () => AuthService().signInFacebook(),
                        imagePath: 'lib/images/Facebook_Logo_Primary.png')
                  ],
                ),

                const SizedBox(height: 40),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Color.fromARGB(255, 106, 104, 104)),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
