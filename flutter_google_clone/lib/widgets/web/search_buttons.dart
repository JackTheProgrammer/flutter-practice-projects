import 'package:flutter/material.dart';

import 'search_button.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            SearchButton(title: "Google search",),
            SizedBox(width: 10,),
            SearchButton(title: "I'm feeling lucky",)
          ],
        )
      ],
    );
  }
}