import 'package:bogbor/pages/main_page.dart';
import 'package:bogbor/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BogBor',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const MainPage(),
    );
  }
}
