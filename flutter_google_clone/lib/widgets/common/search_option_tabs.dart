import 'package:flutter/material.dart';

import '/widgets/common/search_option_tab.dart';

class SearchOptionTabs extends StatelessWidget {
  const SearchOptionTabs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const <Widget>[
          SearchOptionTab(
            icon: Icons.search, 
            text: "All", 
            isActive: true,
          ),
          SizedBox(width: 20,),
          SearchOptionTab(
            icon: Icons.video_library_outlined, 
            text: "Videos", 
          ),
          SizedBox(width: 20,),
          SearchOptionTab(
            icon: Icons.image_outlined, 
            text: "Images", 
          ),
          SizedBox(width: 20,),
          SearchOptionTab(
            icon: Icons.newspaper_outlined, 
            text: "News", 
          ),
          SizedBox(width: 20,),
          SearchOptionTab(
            icon: Icons.more_vert_outlined, 
            text: "More", 
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}