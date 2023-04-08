import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Consumer;

import '/view/widget/recipe_widget.dart';
import '/view/viewmodels/recipies_screen_viewmodel.dart';

class UserRecipiesScreens extends StatefulWidget {
  const UserRecipiesScreens({Key? key}) : super(key: key);

  @override
  State<UserRecipiesScreens> createState() => _UserRecipiesScreensState();
}

class _UserRecipiesScreensState extends State<UserRecipiesScreens> {
  String recipename = "";
  List<String> ingredients = [];
  List<double> amounts = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipiesScreenViewmodel>(
      builder: (context, recipies, _) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton.icon(
                icon: const Icon(
                  Icons.delete_sweep_sharp,
                ),
                onPressed: () async {
                  recipies.deleteRecipies("fwdAwn243");
                },
                label: const Text("Delete all recipies"),
              ),
            ],
          ),
          body: FutureBuilder(
            future: recipies.getAllRecipies("fwdAwn243"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return RecipeWidget(
                      recipename: snapshot.data![index],
                      deleteCallBack: () async {
                        await recipies.deleteRecipe(
                          "fwdAwn243",
                          snapshot.data![index],
                        );
                      },
                    );
                  },
                );
              }
              return const SizedBox(
                child: Center(
                  child: Text("Recipies not found"),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Scaffold(
                    body: ListView(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Recipe name",
                          ),
                          onChanged: (values) {
                            setState(() {
                              recipename = values;
                            });
                          },
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Recipe ingredients"
                                " with comma separation",
                          ),
                          onChanged: (values) {
                            var listOfIngredients = values.split(",").toList();
                            setState(() {
                              ingredients = listOfIngredients;
                            });
                          },
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            hintText: "Recipe ingredient amounts"
                                " with comma separation",
                          ),
                          onChanged: (values) {
                            List<double> listOfIngredientAmounts = values
                                .split(",")
                                .toList()
                                .map((val) => double.tryParse(val)!)
                                .toList();

                            setState(() {
                              amounts = listOfIngredientAmounts;
                            });
                          },
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            await recipies.addRecipe(
                              recipename,
                              "fwdAwn243",
                              ingredients,
                              amounts,
                            );
                          },
                          icon: const Icon(Icons.create),
                          label: const Text("Create recipe"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.food_bank),
          ),
        );
      },
    );
  }
}
