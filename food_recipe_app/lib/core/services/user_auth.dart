import 'package:flutter/material.dart' show debugPrint;
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_url.dart';
import '../config/end_points.dart' as endpoints;
import '/core/models/entities/app_user.dart';

class UserAuth {
  static Future<bool> hasUser(
    String appusername,
    String userpassword,
  ) async {
    var response = await http.post(
      Uri.parse(apiUrl + endpoints.checkUser),
      body: {"appusername": appusername, "userpassword": userpassword},
    );
    bool exists = jsonDecode(response.body)["exists"]! as bool;
    return exists;
  }

  static Future<void> signUp(
    String username,
    String appusername,
    String userpassword,
  ) async {
    var response = await http.post(
      Uri.parse(apiUrl + endpoints.checkUser),
      body: {
        "username": username,
        "appusername": appusername,
        "userpassword": userpassword
      },
    );
    if (response.statusCode == 201) {
      debugPrint("Updated ${response.statusCode}");
    }
    debugPrint(
      "failed with code: ${response.statusCode}, msg: ${response.reasonPhrase}",
    );
  }

  static Future signIn(
    String appusername,
    String userpassword,
  ) async {
    var response = await http.post(
      Uri.parse(apiUrl + endpoints.checkUser),
      body: {"appusername": appusername, "userpassword": userpassword},
    );
    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200 && responseData["signedIn"] == false) {
      return AppUser.fromJson(responseData["signedIn"]);
    }
    return responseData["signedIn"];
  }
}
