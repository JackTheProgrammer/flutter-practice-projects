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
      title: 'Flutter AbsorbPointer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
        child: Main(),
      ),
    );
  }
}

class Main extends StatelessWidget {
const Main({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Absorb pointer")
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: ElevatedButton(
              onPressed: (){},
              child: null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade300
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: AbsorbPointer(
              absorbing: true,
              ignoringSemantics: true,
              child: ElevatedButton(
                onPressed: (){}, 
                child: null
              ),
            ),
          )
        ],
      ),
    );
  }
}