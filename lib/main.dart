import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/home_page.dart';
import 'pages/favorit_page.dart';

void main() {
  runApp(const EndemikApp());
}

class EndemikApp extends StatelessWidget {
  const EndemikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endemik Indonesia',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreen(),
      routes: {
        '/home': (_) => const HomePage(),
        '/favorit': (_) => const FavoritPage(),
      },
    );
  }
}
