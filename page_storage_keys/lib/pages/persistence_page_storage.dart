import 'package:flutter/material.dart';

final globalPageStorageBucket = PageStorageBucket();

class PersistencePageStorageKeyPage extends StatefulWidget {
  const PersistencePageStorageKeyPage({ Key? key }) : super(key: key);

  @override
  State<PersistencePageStorageKeyPage> createState() => _PersistencePageStorageKeyPageState();
}

class _PersistencePageStorageKeyPageState extends State<PersistencePageStorageKeyPage> {
  @override
  void initState() {
    super.initState();
    final state = PageStorage.of(context)!.readState(
      context, 
      identifier: "pageOne"
    );
    // ignore: avoid_print
    print(state);
  }
  
  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: globalPageStorageBucket,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Persistence pageStorage key page"),
          actions: [
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PersistencePageStorageKeyPage()
                )
              )
            )
          ],
        ),
        body: buildPageOne()
      ),
    );
  }
  
  Widget buildPageOne() => ListView.builder(
    key: const PageStorageKey("pageOne"),
    itemCount: 40,
    itemBuilder: (context, index) => ListTile(
      title: Text(
        "${index + 1}",
        style: const TextStyle(fontSize: 24),
      ),
    ) 
  );
}