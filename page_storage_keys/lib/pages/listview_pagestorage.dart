import 'package:flutter/material.dart';

class ListViewPageStorageKeyPage extends StatefulWidget {
  const ListViewPageStorageKeyPage({Key? key}) : super(key: key);

  @override
  _ListViewPageStorageKeyPageState createState() => _ListViewPageStorageKeyPageState();
}

class _ListViewPageStorageKeyPageState extends State<ListViewPageStorageKeyPage> {
  int index = 0;
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text("ListView pageStorage key demo"),
      centerTitle: true,
    ),
    body: buildPages(),
    bottomNavigationBar: buildBottomBar(),
  );
  
  Widget buildPages(){
    switch (index) {
      case 0:
        return buildPageOne();
      case 1:
        return buildPageTwo();
      default:
        return Container();
    }
  }
  
  Widget buildBottomBar() {
    var style = const TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.clear),
          activeIcon: Text('ListView', style: style),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.done),
          activeIcon: Text('Key ListView', style: style),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }
  
  Widget buildPageOne() => ListView.builder(
    itemCount: 40,
    itemBuilder: (context, index) => ListTile(
      title: Text(
        'List item ${index + 1}',
        style: const TextStyle(fontSize: 24),
      ),
    ),
  );
  
  Widget buildPageTwo() => ListView.builder(
    key: const PageStorageKey<String>('pageTwo'),
    itemCount: 40,
    itemBuilder: (context, index) => ListTile(
      title: Text(
        'List item ${index + 1}',
        style: const TextStyle(fontSize: 24),
      ),
    ),
  );
}