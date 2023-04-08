class Recipe {
  String recipename = "";

  Recipe(this.recipename);

  factory Recipe.fromJson(Map json) => Recipe(json['recipename']);

  Map toJson() => {"recipename": recipename};
}
