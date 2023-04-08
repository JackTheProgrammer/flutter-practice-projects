import 'package:flutter/material.dart';
import '/core/services/recipe_crud.dart';

class RecipiesScreenViewmodel extends ChangeNotifier {
  Future<List<String>> getAllRecipies(String appusername) async {
    return await RecipeDbCrud.getAllRecipies(appusername);
  }

  Future<void> addRecipe(
    String recipename,
    String appusername,
    List<String> ingredientnames,
    List<double> ingredientamounts,
  ) async {
    await RecipeDbCrud.createRecipe(
      recipename,
      ingredientnames,
      ingredientamounts,
      appusername,
    );
    notifyListeners();
  }

  Future<void> deleteRecipies(String appusername) async {
    await RecipeDbCrud.deleteAllRecipies(appusername);
    notifyListeners();
  }

  Future<void> deleteRecipe(
    String appusername,
    String recipename,
  ) async {
    await RecipeDbCrud.deleteUserRecipe(
      appusername,
      recipename,
    );
    notifyListeners();
  }
}
