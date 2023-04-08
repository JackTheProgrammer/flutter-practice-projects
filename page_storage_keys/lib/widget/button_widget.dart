import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  late String text;
  late VoidCallback onClicked;
  ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked, 
      child: Text(text, style: const TextStyle(fontSize: 20),),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
    );
  }
}