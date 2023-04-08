import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/screens/common/search_screen.dart';
import '/utils/colors.dart';

class SearchHeader extends StatelessWidget {
const SearchHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20, 
              right: 15, 
              top: 4
            ),
            child: Image.asset(
              "asset/images/google-logo.png", 
              height: 28, 
              width: 92,
            ),
          ),
          const SizedBox(width: 27,),
          Container(
            width: size.width * 0.45,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: searchColor)
            ),
            child: TextFormField(
              onFieldSubmitted: (searchQuery){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      searchQuery: searchQuery,
                      startIndex: "0",
                    )
                  )
                );
              },
              style: const TextStyle(fontSize: 16),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SvgPicture.asset(
                          "asset/images/mic-icon.svg", 
                          height: 20, 
                          width: 20,
                        ),
                        const SizedBox(width: 27,),
                        IconButton(
                          onPressed: (){}, 
                          icon: const Icon(
                            Icons.search, 
                            color: blueColor
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none
              ),
            ),
          )
        ]
      )
    );
  }
}