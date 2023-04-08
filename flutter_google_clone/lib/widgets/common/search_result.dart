import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/utils/colors.dart';

class SearchResult extends StatefulWidget {
  final String link;
  final String linkToGo;
  final String text;
  final String description;
  
  const SearchResult({
    Key? key,
    required this.link,
    required this.linkToGo,
    required this.text,
    required this.description,
  }) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool _showUnderLine = true;
  
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.link),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if(await canLaunchUrl(Uri.parse(widget.linkToGo))){
                await launchUrl(Uri.parse(widget.linkToGo));
              }
            },
            onHover: (hover) {
              setState(() {
                _showUnderLine = hover;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.link,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF202124)
                  ),
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: blueColor,
                    decoration: _showUnderLine ? TextDecoration.underline : TextDecoration.none
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          widget.description, 
          style: const TextStyle(
            fontSize: 14, 
            color: primaryColor
          ),
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}