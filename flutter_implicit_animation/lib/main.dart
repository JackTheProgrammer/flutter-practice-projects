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
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: FadeInDemo(),
        ),
      ),
    );
  }
}

const owlUrl = 'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({Key? key}) : super(key: key);

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  bool isTapped = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
          owlUrl,
        ),
        TextButton(
          child: Text(
            isTapped ? 'Details' : 'Show details',
            style: const TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => {
            setState(() {
              isTapped = !isTapped;
            })
          }
        ),
        AnimatedOpacity(
          opacity: isTapped ? 1.0 : 0.0, 
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: Column(
            children: const [
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        )
      ]
    );
  }
}