import 'package:flutter/material.dart';
import 'package:vazifa4/pages/first_page.dart';
import 'package:vazifa4/pages/home_page.dart';
import 'package:vazifa4/pages/input_code.dart';
import 'package:vazifa4/pages/input_number_page.dart';
import 'package:vazifa4/pages/login_page.dart';
import 'package:vazifa4/pages/sign_up_page.dart';
import 'package:vazifa4/pages/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/seacond":(context) =>const SeaconPage(),
        "/third":(context) =>const ThirdPage(),
        "/login":(context) =>const LoginPage(),
        "/sign":(context) =>const SignUpPage(),
        "/number":(context) =>const InputNumber(),
        "/code":(context) =>const InputCode(),
        "/home":(context) => const Home(),
      },
      home:const FirstPage(),
    );
  }
}
