import 'package:flutter/material.dart';

import '/widgets/common/my_message_card.dart';
import '/widgets/common/recipient_message_card.dart';
import '/utils/info.dart';

class ChatListScreen extends StatelessWidget {
const ChatListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if(messages[index]['isMe'] == true){
          return MyMessageCard(
            text: messages[index]['text'].toString(), 
            time: messages[index]['time'].toString()
          );
        } else {
          return RecipientMessageCard(
            text: messages[index]['text'].toString(), 
            time: messages[index]['time'].toString()
          );
        }
      },
    );
  }
}