import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ydm_sdn_project/pages/auth_page.dart';
// import 'package:ydm_sdn_project/pages/login_page.dart';
=======
import 'package:modernlogintute/pages/auth_page.dart';
// import 'package:modernlogintute/pages/login_page.dart';
>>>>>>> 8780d5b6590d5d159d5adc53799c8b63562e2060
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
