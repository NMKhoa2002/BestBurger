import 'package:best_burger/account/login_page.dart';
import 'package:best_burger/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Best Burger',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
