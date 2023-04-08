import 'package:flutter/material.dart';
import '/utils/colors.dart';

class SearchFooter extends StatelessWidget {
  const SearchFooter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
            horizontal: size.width <= 768 ? 10 : 150, 
            vertical: 15
          ),
          child: Row(
            children: <Widget>[
              const Text("Pakistan"),
              const SizedBox(width: 10,),
              Container(
                height: 20,
                width: 0.5,
                color: Colors.grey,
              ),
              const SizedBox(width: 10,),
              const Icon(
                Icons.circle, 
                size: 12, 
                color: Color(0xff70757a),
              ),
              const SizedBox(width: 10,),
              const Text("Peshawar, KPK, 25000")
            ],
          ),
        ),
        const Divider(
          height: 9,
          thickness: 0,
          color: Colors.black26,
        ),
        Container(
          color: footerColor,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: <Widget>[
              Text("Help", style: TextStyle(fontSize: 15, color: Colors.grey[700]),),
              const SizedBox(width: 20,),
              Text("Send Feedback", style: TextStyle(fontSize: 15, color: Colors.grey[700]),),
              const SizedBox(width: 20,),
              Text("Privacy", style: TextStyle(fontSize: 15, color: Colors.grey[700]),),
              const SizedBox(width: 20,),
              Text("Terms", style: TextStyle(fontSize: 15, color: Colors.grey[700]),),
            ],
          ),
        )
      ],
    );
  }
}