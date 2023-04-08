// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const LogoApp(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition(
      {required this.child, required this.animation, super.key});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> sizeAnimation;
  late Animation<double> opacityAnimation;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    sizeAnimation = Tween<double>(begin: 0, end: 300).animate(controller)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    })
      
    ..addStatusListener((status) {
      print("$status");
    });
    
    opacityAnimation = Tween<double>(begin: 0.1, end: 1).animate(controller)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    })
    ..addStatusListener((status) {
      print("$status");
    });

    animation = Tween<double>(begin: 170, end: 190).animate(controller)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    })
    ..addStatusListener((status) {
      print("$status");
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: opacityAnimation.value,
        child: Container(
          padding: const EdgeInsets.all(32),
          height: animation.value,
          width: animation.value,
          child: SizedBox(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}