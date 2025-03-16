import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: const LoginPage(),
    );
  }
}
