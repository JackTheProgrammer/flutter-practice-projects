import 'package:flutter/material.dart';
import 'package:flutter_google_clone/widgets/common/footer_text.dart';
import '/utils/colors.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      color: footerColor,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              FooterText(title: "About"),
              SizedBox(width: 10,),
              FooterText(title: "Advertising"),
              SizedBox(width: 10,),
              FooterText(title: "Business"),
              SizedBox(width: 10,),
              FooterText(title: "How search works"),
              SizedBox(width: 10,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              FooterText(title: "Privacy"),
              SizedBox(width: 10,),
              FooterText(title: "Terms"),
              SizedBox(width: 10,),
              FooterText(title: "Settings"),
              SizedBox(width: 10,),
            ],
          ),
        ],
      ),
    );
  }
}