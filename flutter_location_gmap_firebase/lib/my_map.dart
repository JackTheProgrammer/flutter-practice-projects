import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  final String docID;
  const MyMap({
    Key? key,
    required this.docID,
  }) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late GoogleMapController googleMapController;
  bool _added = false;
  
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("locations").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator());
        }
        
        if(!_added){
          _animateCameraAsPerLatLng(snapshot);
        }
        
        return GoogleMap(
          markers: {
            Marker(
              markerId: const MarkerId("userMarker"),
              position: LatLng(
                snapshot.data!.docs.singleWhere((element) => element.id == widget.docID)['latitude'],
                snapshot.data!.docs.singleWhere((element) => element.id == widget.docID)['latitude'],
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
            )
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(
              snapshot.data!.docs.singleWhere((element) => element.id == widget.docID)['latitude'],
              snapshot.data!.docs.singleWhere((element) => element.id == widget.docID)['latitude'],
            ),
            zoom: 14.47
          ),
          onMapCreated: (controller) {
            setState(() {
              googleMapController = controller;
              _added = true;
            });
          },
        );
      }
    );
  }
  
  Future<void> _animateCameraAsPerLatLng(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            snapshot.data!.docs.singleWhere((element) => element.id == widget.docID)['latitude'],
            snapshot.data!.docs.singleWhere((element) => element.id == widget.docID)['latitude'],
          ),
          zoom: 14.47
        ),
      )
    );
  }
}