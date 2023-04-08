import 'package:flutter/material.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter WhatsApp Clone',
      theme: ThemeData.dark().copyWith(
        backgroundColor: backgroundColor
      ),
      
    );
  }
}