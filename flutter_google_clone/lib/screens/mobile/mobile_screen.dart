import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/common/search.dart';
import '../../widgets/common/translation_buttons.dart';
import '../../widgets/mobile/mobile_footer.dart';
import '../../widgets/web/search_buttons.dart';
import '../../utils/colors.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({ Key? key }) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.grey,), 
          onPressed: (){},
        ),
        title: SizedBox(
          width: size.width * 0.34,
          child: const DefaultTabController(
            length: 2, 
            child: TabBar(
              labelColor: blueColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: blueColor,
              tabs: [
                Tab(text: "All",),
                Tab(text: "Gmail",)
              ]
            )
          ),
        ),
        actions: [
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
            const MobileFooter()
          ],
        ),
      ),
    );
  }
}