import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '/config/api_key.dart';
import '/config/api_json.dart';

class ApiService{
  bool isDummy;
  ApiService({this.isDummy = false});
  Future<Map<String, dynamic>> fetchData({required String query, String start = "0"}) async {
    try {
      String searchQuery = query.contains(" ") ? query.split("").join("%20") : query;
      if(!isDummy){
        final response = await http.get(
          Uri.parse(
            "https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$contextKey&q=$searchQuery&start=$start"
          )
        );
        if(response.statusCode == 200){
          var data = json.decode(response.body);
          return data;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    
    return apiResponse;
  }
}