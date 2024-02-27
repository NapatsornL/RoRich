import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:rorich/change_password.dart';
import 'package:rorich/chat.dart';
import 'package:rorich/convert_main.dart';
import 'package:rorich/currency_center.dart';
import 'package:rorich/login.dart';
import 'package:rorich/profile_setting.dart';
import 'package:rorich/signin.dart';

void main() async {
  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangePw(),
      routes: {
        '/signin': (context) => Signin(),
        '/login': (context) => Login(),
        '/convert_main': (context) => ConvertMain(),
        '/chat': (context) => Chat(),
        '/profile_setting': (context) => ProfileSetting(),
        '/currency_center': (context) => CurrencyCenter(),
      },
    );
  }
}
