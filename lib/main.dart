import 'package:flutter/material.dart';

import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kasir',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),

      initialRoute: '/login',

      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
