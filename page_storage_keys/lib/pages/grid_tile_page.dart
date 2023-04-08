import 'package:flutter/material.dart';

class GrideTilePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  GrideTilePage({Key? key}) : super(key: key);

  @override
  State<GrideTilePage> createState() => _GrideTilePageState();
}

class _GrideTilePageState extends State<GrideTilePage> {
  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page storage key demo in grids"),
        centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => GrideTilePage(),)),
          ),
        ],
      ),
      body: buildPages(),
      bottomNavigationBar: buildBottomBar(),
    );
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
          activeIcon: Text('GridView', style: style),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.done),
          activeIcon: Text('Key GridView', style: style),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }
  
  Widget buildPages() {
    switch (index) {
      case 0:
        return buildPageOne();
      case 1:
        return buildPageTwo();
      default:
        return Container();
    }
  }
  
  Widget buildPageOne() => GridView.builder(
    itemCount: 40,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
    itemBuilder: (context, index) => GridTile(
      child: Center(
        child: Text(
          'Grid item ${index + 1}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    ),
  );

  Widget buildPageTwo() => GridView.builder(
    key: const PageStorageKey<String>('pageTwo'),
    itemCount: 40,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
    ),
    itemBuilder: (context, index) => GridTile(
      child: Center(
        child: Text(
          'Grid item ${index + 1}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    ),
  );
}