import 'package:flutter/material.dart';

import '/widgets/common/chat_list_screen.dart';
import '/utils/info.dart';
import '/utils/colors.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(info[0]['name'].toString()),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.call)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Expanded(child: ChatListScreen()),
          TextField(
            decoration: InputDecoration(
              fillColor: mobileChatBoxColor,
              filled: true,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.emoji_emotions),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Icon(Icons.camera_alt, color: Colors.grey,),
                    Icon(Icons.attach_file, color: Colors.grey,),
                    Icon(Icons.payment, color: Colors.grey,)
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  style: BorderStyle.none,
                  width: 0,
                )
              ),
              hintText: "Type your message",
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(10)
            ),
          )
        ],
      ),
    );
  }
}