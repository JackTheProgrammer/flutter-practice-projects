class Ingredient {
  String ingredientname = "";

  Ingredient(this.ingredientname);

  factory Ingredient.fromJson(Map json) {
    return Ingredient(json['ingredientname']);
  }

  Map toJson() => {"ingredientname": ingredientname};
}
