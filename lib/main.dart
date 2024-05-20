import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:indehlizi/Auth.dart';
import 'package:indehlizi/v2/pages/MainScreen.dart';
import 'package:provider/provider.dart';
import 'v2/pages/Login Register 2/RegisterScreen2.dart';
import 'v2/pages/Login Signup/LoginScreen.dart';
import 'v2/pages/Login Signup/RegisterScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Auth auth = Auth();
  User? user = auth.getCurrentUser();
  runApp(MyApp(user: user));
}

class MyApp extends StatelessWidget {
  final User? user;

  const MyApp({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user != null ? MainScreen() : LoginScreen(),
      /*routes: {
        RegisterScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const LoginScreen(),
      },*/
    );
  }
}

