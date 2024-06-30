import 'package:flutter/material.dart';
import 'package:slicing_uiquran/pages/page1.dart';
import 'package:slicing_uiquran/pages/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Al-Quran",
      // home: SplashScreen(),
      home: Page1(),
    );
  }
}
