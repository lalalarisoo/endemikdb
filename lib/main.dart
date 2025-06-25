import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/splash_screen.dart';
import 'providers/favorite_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const EndemikApp(),
    ),
  );
}

class EndemikApp extends StatelessWidget {
  const EndemikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Endemik Indonesia',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreen(),
    );
  }
}
