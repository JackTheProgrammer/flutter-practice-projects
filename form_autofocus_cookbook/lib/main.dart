import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({ Key? key }) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late FocusNode focusNode;
  
  @override
  void initState() {
    focusNode = FocusNode();
    super.initState();
  }
  
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form focus demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:  <Widget>[
            const TextField(
              autofocus: true,
            ),
            TextField(
              focusNode: focusNode,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => focusNode.requestFocus(),
        tooltip: 'Focus Second Text Field',
        child: const Icon(Icons.edit),
      ),
    );
  }
}