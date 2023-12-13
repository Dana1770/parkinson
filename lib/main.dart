import 'package:flutter/material.dart';
import 'package:grad_pro/Record/RecordScreen.dart';
import 'package:grad_pro/splash/Splash.dart';

import 'package:grad_pro/verification/VerificationCode.dart';
import 'package:grad_pro/verification/verification.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home:Splash(),
    );
  }
}


