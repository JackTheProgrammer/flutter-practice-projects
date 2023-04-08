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
      title: 'Flutter richtext Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Main(title: "Rich text demo"),
    );
  }
}

class Main extends StatefulWidget {
  final String title;
  const Main({ Key? key, required this.title}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: const Icon(Icons.rice_bowl),
        elevation: 5,
        primary: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
        ],
      ),
      body: Center(
          child: RichText(
            text: TextSpan(
              text: "Ola",
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(
                  text: "Hello", 
                  style: TextStyle(
                    color: Colors.brown
                  )
                ),
                TextSpan(
                  text: "dear", 
                  style: TextStyle(
                    backgroundColor: Colors.grey, 
                    color: Colors.white
                  )
                ),
                TextSpan(
                  text: "developer",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    backgroundColor: Colors.black26
                  )
                )
              ]
            ),
          ),
        )
      );
  }
}