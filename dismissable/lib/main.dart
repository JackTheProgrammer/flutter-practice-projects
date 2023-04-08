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
  Widget build(BuildContext context) {
    List<int> items = List.generate(100, ((index) => index));
    Color backgroundColor = Colors.red.shade200;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter dismissible demo"),
        centerTitle: true,
        primary: true,
        actions: [
          TextButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.money), 
            label: const Text("Make some cash"),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return Dismissible(
            key: ValueKey<int>(index), 
            background: Container(
              color: backgroundColor
            ),
            onDismissed: (direction) {
              items.removeAt(index);
            },
            child: ListTile(
              title: Text("Item ${items[index]}"),
            )
          );
        }
      ),
    );
  }
}