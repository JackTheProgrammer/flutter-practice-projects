import 'package:flutter/material.dart' show debugPrint;
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/api_url.dart';
import '../config/end_points.dart' as endpoints;
import '/core/models/junction/recipe_details.dart';

class RecipeDbCrud {
  static Future<void> createRecipe(
    String recipename,
    List<String> ingredientnames,
    List<double> ingredientamounts,
    String appusername,
  ) async {
    var response = await http.post(
      Uri.parse(
        apiUrl + endpoints.createRecipe,
      ),
      body: {
        "recipename": recipename,
        "ingredientname": ingredientnames,
        "ingredientamount": ingredientamounts,
        "appusername": appusername
      },
    );
    if (response.statusCode == 201) {
      debugPrint("Successfully created");
    }
    debugPrint("API ERROR: ${response.statusCode}");
  }

  static Future<void> addIngredientToUserRecipe(
    String appusername,
    String recipename,
    String ingredientname,
    double ingredientamount,
  ) async {
    var response = await http.post(
      Uri.parse(apiUrl + endpoints.addIngredient),
      body: {
        "appusername": appusername,
        "recipename": recipename,
        "ingredientname": ingredientname,
        "ingredientamount": ingredientamount
      },
    );
    if (response.statusCode == 201) {
      debugPrint("Updated successfully");
    }
    debugPrint("API ERROR: ${response.statusCode}");
  }

  static Future<List<String>> getAllRecipies(String appusername) async {
    var res = await http.post(
      Uri.parse(apiUrl + endpoints.getRecipies),
      body: {"appusername": appusername},
    );
    Map<String, List<String>> recipies =
        json.decode(res.body) as Map<String, List<String>>;

    return recipies["recipies"] == [] ? [] : [...recipies["recipies"]!];
  }

  static Future<List<RecipeDetails>> getRecipeDetails(
    String appusername,
    String recipename,
  ) async {
    var response = await http.post(
      Uri.parse(apiUrl + endpoints.getRecipeDetails),
      body: {"appusername": appusername, "recipename": recipename},
    );

    List<RecipeDetails> recipeDetails = <RecipeDetails>[];

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      Map<String, List<Map>> recipeDetailsResponse =
          responseData as Map<String, List<Map>>;

      for (Map recipiesJson in recipeDetailsResponse["recipeDetails"] ??
          [
            {
              "ingredientname": "",
              "ingredientamount": 0.0,
            },
          ]) {
        recipeDetails.add(RecipeDetails.fromJson(recipiesJson));
      }
    }

    return recipeDetails;
  }

  static Future<void> updateRecipeName(
    String appusername,
    String oldrecipename,
    String newrecipename,
  ) async {
    var response = await http.put(
      Uri.parse(
        apiUrl + endpoints.recipeNewname,
      ),
      body: {
        "appusername": appusername,
        "oldrecipename": oldrecipename,
        "newrecipename": newrecipename
      },
    );
    if (response.statusCode == 201) {
      debugPrint("Updated ${response.statusCode}");
    }
    debugPrint(
      "failed with code: ${response.statusCode}, msg: ${response.reasonPhrase}",
    );
  }

  static Future<void> updateIngredientName(
    String appusername,
    String recipename,
    String oldingredientname,
    String newingredientname,
  ) async {
    var response = await http.post(
      Uri.parse(apiUrl + endpoints.ingredientNewname),
      body: {
        "appusername": appusername,
        "recipename": recipename,
        "oldingredientname": oldingredientname,
        "newingredientname": newingredientname
      },
    );
    if (response.statusCode == 201) {
      debugPrint("Updated ${response.statusCode}");
    }
    debugPrint(
      "failed with code: ${response.statusCode}, msg: ${response.reasonPhrase}",
    );
  }

  static Future<void> updateIngredientAmount(
    String recipename,
    String appusername,
    String ingredientname,
    double newingredientamount,
  ) async {
    var response = await http.put(
      Uri.parse(apiUrl + endpoints.ingredientNewAmount),
      body: {
        "appusername": appusername,
        "recipename": recipename,
        "ingredientname": ingredientname,
        "newingredientamount": newingredientamount
      },
    );
    if (response.statusCode == 201) {
      debugPrint("Updated ingredient amount! ${response.statusCode}");
    }
    debugPrint(
      "failed with code: ${response.statusCode}, msg: ${response.reasonPhrase}",
    );
  }

  static Future<void> deleteUserRecipe(
    String appusername,
    String recipename,
  ) async {
    var response = await http.delete(
      Uri.parse(apiUrl + endpoints.deleteRecipe),
      body: {"appusername": appusername, "recipename": recipename},
    );
    if (response.statusCode == 201) {
      debugPrint("Deleted user recipe! ${response.statusCode}");
    }
    debugPrint(
      "failed with code: ${response.statusCode}, msg: ${response.reasonPhrase}",
    );
  }

  static Future<void> deleteUserRecipeIngredient(
    String appusername,
    String recipename,
    String ingredientname,
  ) async {
    var response = await http.delete(
      Uri.parse(apiUrl + endpoints.deleteIngredient),
      body: {
        "appusername": appusername,
        "recipename": recipename,
        "ingredientname": ingredientname
      },
    );
    if (response.statusCode == 201) {
      debugPrint("Deleted user recipe! ${response.statusCode}");
    }
    debugPrint(
      "failed with code: ${response.statusCode}, msg: ${response.reasonPhrase}",
    );
  }

  static Future<void> deleteAllRecipies(String appusername) async {
    var response = await http.delete(
      Uri.parse(apiUrl + endpoints.deleteAllRecipies),
      body: {"appusername": appusername},
    );
    if (response.statusCode == 201) {
      debugPrint("Deleted all recipies!!! ${response.statusCode}");
    }
    debugPrint(
      "failed with code: ${response.statusCode}, msg: ${response.reasonPhrase}",
    );
  }
}
