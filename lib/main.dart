import 'package:flutter/material.dart';
import 'loginscreen.dart'; // 👈 import your file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // 👈 calling login screen here
    );
  }
}
