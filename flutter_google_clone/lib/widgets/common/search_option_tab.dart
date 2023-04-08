import 'package:flutter/material.dart';
import '/utils/colors.dart';

class SearchOptionTab extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isActive;
  const SearchOptionTab({
    Key? key,
    required this.icon,
    required this.text,
    this.isActive = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 18,
              color: isActive ? blueColor : Colors.grey,
            ),
            const SizedBox(width: 3,),
            Text(
              text,
              style: TextStyle(
                fontSize: 15, 
                color: isActive ? blueColor : Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(width: 3,),
        isActive ? Container(
          width: 40,
          height: 3,
          color: blueColor,
        ) : Container()
      ],
    );
  }
}
