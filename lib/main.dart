import 'package:flutter/material.dart';
import 'Login/login.dart';
import 'View/homepage.dart';
import 'View/profile.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 2 App',
      theme: ThemeData(
        textTheme: GoogleFonts.soraTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/login': (context) =>  LoginPage(),
        '/home': (context) =>  Homepage(username: 'admin'),
        '/profile': (context) =>  ProfilePage(),
      },
    );
  }
}
