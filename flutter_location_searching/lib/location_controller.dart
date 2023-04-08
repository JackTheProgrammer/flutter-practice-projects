// ignore_for_file: implementation_imports, prefer_final_fields

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/src/places.dart';
import 'package:http/http.dart' as http;

class LocationController extends GetxController {
  final Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark => _pickPlaceMark;
  
  List<Prediction> _predictionsList = [];
  
  Future<List<Prediction>> searchLocation(String placeName, BuildContext context) async {
    if(placeName.isEmpty != true){
      http.Response response = await getLocationData(placeName);
      var data = json.decode(response.body.toString());
      if(data['status'] == 'OK'){
        _predictionsList = [];
        data['predictions'].forEach((prediction){
          _predictionsList.add(Prediction.fromJson(prediction));
        });
      } else {
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionsList;
  }
  Future<http.Response> getLocationData(String text) async {
    http.Response response;
    
    response = await http.get(
      Uri.parse("http://mvs.bslmeiyu.com/api/v1/config/place-api-autocomplete?search_text=$text"),
      headers: {"Content-Type": "application/json"},
    );

    log(jsonDecode(response.body));
    return response;
  }
}