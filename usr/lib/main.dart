import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/welcome_screen.dart';

void main() {
  runApp(const AdmissionApp());
}

class AdmissionApp extends StatelessWidget {
  const AdmissionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'High School Admission Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}