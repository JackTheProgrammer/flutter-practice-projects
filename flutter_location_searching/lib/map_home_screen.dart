import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'location_controller.dart';

class MapHomeScreen extends StatefulWidget {
  const MapHomeScreen({ Key? key }) : super(key: key);

  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;
  @override
  void initState(){
    super.initState();
    _cameraPosition = const CameraPosition(target: LatLng(
      45.521563,-122.677433
    ), zoom: 17);
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      builder: (locationController){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Maps Sample App'),
            backgroundColor: Colors.green[700],
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: (GoogleMapController mapController) {
                  _mapController = mapController;
                  // locationController.setMapController(mapController);
                },
                initialCameraPosition: _cameraPosition
              ),
              Positioned(
                top: 100,
                left: 10, right: 20,
                child: GestureDetector(
                  onTap:() {},
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, size: 25, color: Theme.of(context).primaryColor),
                        const SizedBox(width: 5),
                        //here we show the address on the top
                        Expanded(
                          child: Text(
                            '${locationController.pickPlaceMark.name ?? ''} ${locationController.pickPlaceMark.locality ?? ''} '
                            '${locationController.pickPlaceMark.postalCode ?? ''} ${locationController.pickPlaceMark.country ?? ''}',
                            style: const TextStyle(fontSize: 20),
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.search, size: 25, color: Theme.of(context).textTheme.bodyText1!.color),
                      ]
                    ),
                  ),
                ),
              ),
            ],
          )
      );
    },
    );
  }
}