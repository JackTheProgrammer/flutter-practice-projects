// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '/core/config/api_url.dart';
import '/view/viewmodels/recipies_screen_viewmodel.dart';
import '/view/screens/user_recipies_screens.dart';
import '/view/viewmodels/recipe_ingredient_screen_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<RecipeIngredientScreenViewmodel>(
          create: (context) => RecipeIngredientScreenViewmodel(),
        ),
        ListenableProvider<RecipiesScreenViewmodel>(
          create: (context) => RecipiesScreenViewmodel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future getUrlData() async {
    var request = http.Request(
      'GET',
      Uri.parse(apiUrl),
    );
    request.headers.addAll({
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Methods": "GET"
    });

    print(request);
    http.StreamedResponse response = await request.send();
    print(response);
    var decode = jsonDecode(await response.stream.bytesToString());
    return decode;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: getUrlData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: ListView(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      var res = await getUrlData();
                      debugPrint(res.toString());
                    },
                    child: const Text("Press me"),
                  ),
                ],
              ),
            );
          }
          print('Data Fetched');
          return const UserRecipiesScreens();
        },
      ),
    );
  }
}
