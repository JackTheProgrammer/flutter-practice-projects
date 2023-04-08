import 'package:flutter/material.dart';
import 'package:food_recipe_app/view/screens/recipe_detail_screen.dart';

class RecipeWidget extends StatefulWidget {
  final String recipename;
  final VoidCallback deleteCallBack;
  const RecipeWidget({
    Key? key,
    required this.recipename,
    required this.deleteCallBack,
  }) : super(key: key);

  @override
  State<RecipeWidget> createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          "assets/png-clipart-recipe-cooking-chef-dish-food-cooking-food-recipe-thumbnail.png",
        ),
        Text(widget.recipename),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(
                      recipename: widget.recipename,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.navigate_next_rounded),
            ),
            IconButton(
              onPressed: widget.deleteCallBack,
              icon: const Icon(Icons.remove_circle),
            ),
          ],
        )
      ],
    );
  }
}
