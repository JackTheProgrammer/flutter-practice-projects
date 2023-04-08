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
  List<int> dummyList = List<int>.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).primaryColor;
    Color evenColor = themeColor.withOpacity(0.15);
    Color oddColor = themeColor.withOpacity(0.5);
    
    return Scaffold(
      appBar: AppBar(title: const Text("re-orderable list view demo")),
      body: ReorderableListView(
        children: [
          for(int index = 0; index < dummyList.length; index += 1)
          ListTile(
            key: Key("$index"),
            title: Text("Item $index"),
            tileColor: dummyList[index].isEven ? evenColor : oddColor
          )
        ], 
        onReorder: (oldIndex, newIndex){
          setState(() {
            final removedItem = dummyList.removeAt(oldIndex);
            dummyList.insert(newIndex, removedItem);
          });
        }
      ),
    );
  }
}