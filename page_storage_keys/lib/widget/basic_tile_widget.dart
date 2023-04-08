import 'package:flutter/material.dart';

class BasicTile{
  late String title;
  late List<BasicTile> tiles;
  
  BasicTile({
    required this.title,
    this.tiles = const []
  });
}

// ignore: must_be_immutable
class ExpansionPageStorageKeyPage extends StatelessWidget {
  BasicTile? basicTile;
  ExpansionPageStorageKeyPage({
    Key? key,
    this.basicTile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = basicTile?.title;
    final tiles = basicTile?.tiles;
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.white)
      ),
      child: ExpansionTile(
        title: Text(title!),
        key: PageStorageKey<String>(title),
        children: tiles!.map((tile) => ExpansionPageStorageKeyPage(basicTile: tile)).toList(),
      ),
    );
  }
}

final basicTiles = <BasicTile>[
  BasicTile(title: 'Countries', tiles: [
    BasicTile(title: 'Russia'),
    BasicTile(title: 'Canada'),
    BasicTile(title: 'USA'),
    BasicTile(title: 'China'),
    BasicTile(title: 'China'),
    BasicTile(title: 'Australia'),
    BasicTile(title: 'India'),
    BasicTile(title: 'Argentina'),
  ]),
  BasicTile(title: 'Dates', tiles: [
    BasicTile(title: '2020', tiles: buildMonths()),
    BasicTile(title: '2021', tiles: buildMonths()),
    BasicTile(title: '2022'),
    BasicTile(title: '2023'),
  ]),
];

List<BasicTile> buildMonths() => [
  'January',
  'February',
  'March',
  'April',
  'November',
  'December',
].map<BasicTile>(buildMonth).toList();

BasicTile buildMonth(String month) => BasicTile(
  title: month, 
  tiles: List.generate(28, (index) => BasicTile(title: '$index'))
);