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
  int acceptedData = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Draggable<int>(
            data: 10,
            feedback: Container(
              color: Colors.green.shade600,
              width: 100,
              height: 100,
              child: const Icon(Icons.directions_walk),
            ),
            childWhenDragging: Container(
              color: Colors.cyanAccent.shade700,
              width: 100,
              height: 100,
              child: const Text("Child when dragging"),
            ),
            child: Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              child: const Text("Draggable"),
            ), 
          ),
          DragTarget<int>(
            builder: (context, candidateData, rejectedData){
              return Container(
                color: Colors.blue.shade500,
                width: 100,
                height: 100,
                child: Text("Val: $acceptedData"),
              );
            },
            onAccept: (data) {
              setState(() {
                acceptedData += data;
              });
            },
          )
        ],
      ),
    );
  }
}