import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

import 'my_map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp>  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final loc.Location location = loc.Location();
  late StreamSubscription<loc.LocationData> locationSubscription;
  
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  
  _requestUserLocationPermission()async {
    final permissionStatus = await Permission.location.request();
    if(permissionStatus.isGranted == true){
      log("granted");
    } else if(permissionStatus.isDenied == true){
      _requestUserLocationPermission();
    } else if(permissionStatus.isPermanentlyDenied == true){
      openAppSettings();
    }
  }
  
  @override
  void initState() {
    super.initState();
    _requestUserLocationPermission();
  }
  
    _getUserLocation() async {
    try {
      final locationData = await location.getLocation();
      await FirebaseFirestore.instance
            .collection("locations")
            .doc('user')
            .set({
              "latitude": locationData.latitude,
              "longitude": locationData.longitude
            }, SetOptions(merge: true));
    } catch (e) {
      log(e.toString());
    }
  }
  
  Future<void> _listenLocation() async {
    locationSubscription = location.onLocationChanged.handleError((error){
      log(error);
      locationSubscription.cancel();
    }).listen((currentLocation) { 
      firebaseFirestore
      .collection("locations")
      .doc("user")
      .set({
        "latitude": currentLocation.latitude,
        "longitude": currentLocation.longitude
      }, SetOptions(merge: true));
    });
  }
  
  _stopListening(){
    locationSubscription.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location live streaming"),
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: _getUserLocation, 
            child: const Text("Add my location")
          ),
          TextButton(
            onPressed: _listenLocation, 
            child: const Text("Start streaming live location")
          ),
          TextButton(
            onPressed: _stopListening, 
            child: const Text("Stop streaming live location")
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firebaseFirestore
                      .collection("locations")
                      .snapshots(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(snapshot.data!.docs[index]['name'].toString()),
                      subtitle: Row(
                        children: <Widget>[
                          Text(snapshot.data!.docs[index]['latitude'].toString()),
                          const SizedBox(width: 20,),
                          Text(snapshot.data!.docs[index]['longitude'].toString()),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.directions),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyMap(
                                docID: snapshot.data!.docs[index].id,
                              )
                            )
                          );
                        },
                      ),
                    );
                  }
                );
              }
            )
          ),
        ],
      ),
    );
  }
}