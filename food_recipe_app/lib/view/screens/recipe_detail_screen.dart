import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Consumer;

import '/view/viewmodels/recipe_ingredient_screen_viewmodel.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String recipename;
  const RecipeDetailScreen({
    Key? key,
    required this.recipename,
  }) : super(key: key);

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  double newAmount = 0.0;
  String newIngredient = "";

  String createdIngredient = "";
  double createdAmount = 0.0;

  Widget buildIngredientnameUpdateNameField(
    String oldingredientname,
    RecipeIngredientScreenViewmodel viewmodel,
  ) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(
        bottom: 10.0,
        left: 5.0,
        right: 5.0,
      ),
      title: const Text("Upgrade ingredient name"),
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              newIngredient = value;
            });
          },
        ),
        IconButton(
          onPressed: () {
            viewmodel.updateIngredientname(
              "fwdAwn243",
              widget.recipename,
              oldingredientname,
              newIngredient,
            );
          },
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  Widget buildUpdateIngredientAmountField(
    String appusername,
    String recipename,
    String ingredientname,
    RecipeIngredientScreenViewmodel viewmodel,
  ) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(
        bottom: 10.0,
        left: 5.0,
        right: 5.0,
      ),
      title: const Text("Upgrade ingredient amount"),
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              newAmount = double.tryParse(value)!;
            });
          },
        ),
        IconButton(
          onPressed: () {
            viewmodel.updateIngredientamount(
              appusername,
              recipename,
              ingredientname,
              newAmount,
            );
          },
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeIngredientScreenViewmodel>(
      builder: (context, recipeDetails, _) {
        return Scaffold(
          body: ListView(
            children: [
              Text(widget.recipename),
              FutureBuilder(
                future: recipeDetails.getRecipeDetails(
                  "fwdAwn243",
                  widget.recipename,
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No ingredients found"),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var recipeDetail = snapshot.data![index];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            Text(recipeDetail.ingredientname),
                            const SizedBox(
                              width: 6.0,
                            ),
                            buildIngredientnameUpdateNameField(
                              recipeDetail.ingredientname,
                              recipeDetails,
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            Text(recipeDetail.ingredientamount.toString()),
                            const SizedBox(
                              width: 3.0,
                            ),
                            buildUpdateIngredientAmountField(
                              "fwdAwn243",
                              widget.recipename,
                              recipeDetail.ingredientname,
                              recipeDetails,
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            IconButton(
                              onPressed: () {
                                recipeDetails.deleteRecipeIngredient(
                                  "fwdAwn243",
                                  widget.recipename,
                                  recipeDetail.ingredientname,
                                );
                              },
                              icon: const Icon(Icons.delete_forever),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Scaffold(
                    body: ListView(
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Create ingredient name",
                          ),
                          onChanged: (value) {
                            setState(() {
                              createdIngredient = value;
                            });
                          },
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Create ingredient amount",
                          ),
                          onChanged: (value) {
                            setState(() {
                              createdAmount = double.tryParse(value)!;
                            });
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            recipeDetails.addIngredient(
                              "fwdAwn243",
                              widget.recipename,
                              createdIngredient,
                              createdAmount,
                            );
                          },
                          icon: const Icon(Icons.add_box_rounded),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
