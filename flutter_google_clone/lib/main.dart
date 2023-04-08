import 'package:flutter/material.dart';

import '/layout/responsive_layout_screen.dart';
import 'screens/web/web_screen.dart';
import '/utils/colors.dart';
import 'screens/mobile/mobile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home: const ResponsiveLayoutScreen(
        mobileScreen: MobileScreen(), 
        webScreen: WebScreen()
      ),
    );
  }
}

