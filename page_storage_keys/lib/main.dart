import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/grid_tile_page.dart';
import '../pages/persistence_page_storage.dart';
import '../pages/listview_pagestorage.dart';

import '../widget/basic_tile_widget.dart';
import '../widget/button_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Persistence pageStorage key page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              ButtonWidget(
                text: "ExpansionTile", 
                onClicked: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ExpansionPageStorageKeyPage()
                  )
                )
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: "ListView", 
                onClicked: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListViewPageStorageKeyPage()
                  )
                )
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: "GridView", 
                onClicked: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GrideTilePage()
                  )
                )
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                text: "PersistencePageStorage", 
                onClicked: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PersistencePageStorageKeyPage()
                  )
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}