import 'package:flutter/material.dart';

import '/core/models/junction/recipe_details.dart';
import '/core/services/recipe_crud.dart';

class RecipeIngredientScreenViewmodel extends ChangeNotifier {
  Future<List<RecipeDetails>> getRecipeDetails(
    String appusername,
    String recipename,
  ) async {
    return await RecipeDbCrud.getRecipeDetails(
      appusername,
      recipename,
    );
  }

  void addIngredient(
    String appusername,
    String recipename,
    String ingredientname,
    double ingredientamount,
  ) async {
    await RecipeDbCrud.addIngredientToUserRecipe(
      appusername,
      recipename,
      ingredientname,
      ingredientamount,
    );
    notifyListeners();
  }

  void updateIngredientname(
    String appusername,
    String recipename,
    String oldingredientname,
    String newingredientname,
  ) async {
    await RecipeDbCrud.updateIngredientName(
      appusername,
      recipename,
      oldingredientname,
      newingredientname,
    );
    notifyListeners();
  }

  void updateIngredientamount(
    String appusername,
    String recipename,
    String ingredientname,
    double newingredientamount,
  ) async {
    await RecipeDbCrud.updateIngredientAmount(
      recipename,
      appusername,
      ingredientname,
      newingredientamount,
    );
    notifyListeners();
  }

  void updateRecipename(
    String appusername,
    String oldrecipename,
    String newrecipename,
  ) async {
    await RecipeDbCrud.updateRecipeName(
      appusername,
      oldrecipename,
      newrecipename,
    );
    notifyListeners();
  }

  void deleteRecipeIngredient(
    String appusername,
    String recipename,
    String ingredientname,
  ) async {
    await RecipeDbCrud.deleteUserRecipeIngredient(
      appusername,
      recipename,
      ingredientname,
    );
    notifyListeners();
  }
}
