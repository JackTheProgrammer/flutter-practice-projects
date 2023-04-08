import 'package:flutter/material.dart';
import '/utils/colors.dart';

class SearchButton extends StatelessWidget {
  final String title;
  const SearchButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialButton(
      elevation: 0,
      onPressed: (){},
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      color: searchBorder,
      child: Text(title),
    );
  }
}
