import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/web/web_footer.dart';
import '../../widgets/common/translation_buttons.dart';
import '../../widgets/common/search.dart';
import '../../widgets/web/search_buttons.dart';
import '/utils/colors.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({ Key? key }) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          TextButton(
            onPressed: (){}, 
            child: const Text(
              "Gmail",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400
              ),
            )
          ),
          TextButton(
            onPressed: (){}, 
            child: const Text(
              "Images",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400
              ),
            )
          ),
          const SizedBox(width: 10,),
          IconButton(
            onPressed: (){}, 
            icon: SvgPicture.asset(
              "asset/images/more_apps.svg", 
              color: primaryColor,
            ),
          ),
          const SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0
            ).copyWith(
              right: 10
            ), // copyWith
            child: MaterialButton(
              onPressed: (){},
              color: Colors.blue[800],
              child: const Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 3),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.25,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Search(),
                  SizedBox(height: 20,),
                  SearchButtons(),
                  SizedBox(height: 20,),
                  TranslationButtons()
                ],
              )
            ),
            const WebFooter()
          ],
        ),
      ),
    );
  }
}