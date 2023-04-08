import 'package:flutter/material.dart';

import '/screens/mobile_chat_screen.dart';
import '/utils/info.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({ Key? key }) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override 
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MobileChatScreen()
                    )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        info[index]["profilePic"].toString(),
                      ),
                      radius: 30,
                    ),
                    title: Text(
                      info[index]["name"].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        info[index]["message"].toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),
                      )
                    ),
                    trailing: Text(
                      info[index]['time'].toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(indent: 85, color: Colors.grey,),
            ],
          );
        },
      )
    );
  }
}