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
  bool ignoring = false;
  void setIgnoring(bool newValue) {
    setState(() {
      ignoring = newValue;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
          child: Text(ignoring ? "Is ignoring" : "Not ignoring"), 
          onPressed: (){
            setIgnoring(!ignoring);
          },
        ),
      ),
      body: IgnorePointer(
        ignoring: ignoring,
        child: Column(
          children: <Widget>[
            Text('Ignoring: $ignoring'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Click me!'),
            ),
          ],
        ),
      )
    );
  }
}