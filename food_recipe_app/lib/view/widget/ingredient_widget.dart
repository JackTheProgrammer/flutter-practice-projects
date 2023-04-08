import 'package:flutter/material.dart';

class IngredientWidget extends StatefulWidget {
  final String ingredientname;
  final double ingredientamount;

  final TextField updateIngredientNameTextField;
  final TextField updateIngredientAmountTextField;

  final IconButton deleteIngredientButton;
  final IconButton updateIngredientNameButton;
  final IconButton updateIngredientAmountButton;

  const IngredientWidget({
    Key? key,
    required this.ingredientname,
    required this.ingredientamount,
    required this.updateIngredientNameTextField,
    required this.updateIngredientAmountTextField,
    required this.deleteIngredientButton,
    required this.updateIngredientNameButton,
    required this.updateIngredientAmountButton,
  }) : super(key: key);

  @override
  State<IngredientWidget> createState() => _IngredientWidgetState();
}

class _IngredientWidgetState extends State<IngredientWidget> {
  Widget buildUpdateIngredientNameField() {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(
        bottom: 10.0,
        left: 5.0,
        right: 5.0,
      ),
      title: const Text("Upgrade ingredient name"),
      children: [
        widget.updateIngredientNameTextField,
        widget.updateIngredientNameButton,
      ],
    );
  }

  Widget buildUpdateIngredientAmountField() {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(
        bottom: 10.0,
        left: 5.0,
        right: 5.0,
      ),
      title: const Text("Upgrade ingredient amount"),
      children: [
        widget.updateIngredientAmountTextField,
        widget.updateIngredientAmountButton,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.ingredientname),
        buildUpdateIngredientNameField(),
        buildUpdateIngredientAmountField(),
        widget.deleteIngredientButton,
      ],
    );
  }
}
