import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/screens/common/search_screen.dart';
import '/utils/colors.dart';

class Search extends StatelessWidget {
const Search({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Image.asset(
            "asset/images/google-logo.png", 
            height: size.height * 0.15,
          )
        ),
        const SizedBox(height: 20,),
        Center(
          child: SizedBox(
            width: size.width > 768 ? size.width * 0.4 : size.width * 0.9 ,
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
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: searchBorder
                  )
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: (){}, 
                    icon: SvgPicture.asset("asset/images/mic-icon.svg", color: searchColor,)
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: (){}, 
                    icon: SvgPicture.asset("asset/images/search-icon.svg", color: searchColor,)
                  ),
                ),
              ),
            ),
          )
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}