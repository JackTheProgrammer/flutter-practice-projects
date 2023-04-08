import 'package:flutter/material.dart';
import 'card_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CardFormScreen()
          )
        ),
        title: const Text("Go to the card form"),
        trailing: const Icon(Icons.chevron_right_outlined),
      ),
    );
  }
}