import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class WebSearchBar extends StatefulWidget {
  const WebSearchBar({ Key? key }) : super(key: key);

  @override
  State<WebSearchBar> createState() => _WebSearchBarState();
}

class _WebSearchBarState extends State<WebSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: dividerColor,
          )
        )
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: searchBarColor,
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), 
            child: Icon(
              Icons.search,
              size: 20,
            ),
          ),
          hintText: "Search or start new chat",
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          contentPadding: const EdgeInsets.all(10)
        ),
      ), 
    );
  }
}