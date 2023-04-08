import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/utils/colors.dart';

import '/widgets/common/chat_list_screen.dart';
import '/widgets/web/web_app_bar.dart';
import '/widgets/web/web_profile_bar.dart';
import '/widgets/web/web_search_bar.dart';
import '/widgets/common/contact_screen.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({ Key? key }) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactsScreen()
                ],
              )
            ),
          ),
          // Web screen
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/backgroundImage.png",),
                fit: BoxFit.cover
              ),
            ),
            child: Column(
              children: <Widget>[
                const WebAppBar(),
                const Expanded(child: ChatListScreen()),
                // Messaging field
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: dividerColor
                      )
                    ),
                    color: chatBarMessage
                  ),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.emoji_emotions), color: Colors.grey,
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.attach_file), color: Colors.grey,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: searchBarColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  style: BorderStyle.none,
                                  width: 0,
                                )
                              )
                            ),
                          ),
                        )
                      ),
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.mic), color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}