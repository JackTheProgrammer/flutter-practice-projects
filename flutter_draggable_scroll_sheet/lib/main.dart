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
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("DraggableScrollableSheet demo"),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          initialChildSize: 0.3,
          maxChildSize: 0.9,
          minChildSize: 0.11,
          builder: (context, scrollController) => ListView.builder(
            controller: scrollController,
            itemCount: 25,
            itemBuilder: (context, index) => ListTile(
              tileColor: Colors.blue.shade400,
              title: Text("Item $index"),
            )
          )
        ),
      ),
    );
  }
}