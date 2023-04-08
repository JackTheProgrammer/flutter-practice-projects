import 'package:flutter/material.dart';
import '../widget/basic_tile_widget.dart';

class ExpansionTilePage extends StatelessWidget {
  const ExpansionTilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page storage keys demo"),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            buildPageOne(),
            buildPageTwo(),
          ]
        ),
      )
    );
  }
  
  Widget buildPageOne() => ListView(
    children: basicTiles.map((tile) => ExpansionPageStorageKeyPage(basicTile: tile,)).toList(),
  );
  
  Widget buildPageTwo() => ListView(
    key: const PageStorageKey<String>("pageTwo"),
    children: basicTiles.map((tile) => ExpansionPageStorageKeyPage(basicTile: tile,)).toList(),
  );
}