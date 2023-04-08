import 'package:flutter/material.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget mobileScreen, webScreen;
  
  const ResponsiveLayoutScreen({
    Key? key,
    required this.mobileScreen,
    required this.webScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (context, constraint){
        if(constraint.maxWidth <= 768){
          return mobileScreen;
        } 
        return webScreen;
      },
    );
  }
}
