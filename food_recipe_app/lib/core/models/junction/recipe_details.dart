class RecipeDetails {
  String recipename = "";
  String ingredientname = "";
  double ingredientamount = 0.0;
  String appusername = "";

  RecipeDetails(
    this.recipename,
    this.ingredientname,
    this.ingredientamount,
    this.appusername,
  );

  factory RecipeDetails.fromJson(Map json) {
    return RecipeDetails(
      json['recipename'] ?? "",
      json['ingredientname'] ?? "",
      json['ingredientamount'] ?? "",
      json['appusername'] ?? "",
    );
  }

  Map toJson() {
    return {
      'recipename': recipename,
      'ingredientname': ingredientname,
      'ingredientamount': ingredientamount,
      'appusername': appusername
    };
  }
}
