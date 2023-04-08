import 'package:flutter/material.dart';
import '../app/chat/chat.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Agora demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const ChatScreen(),
    );
  }
}