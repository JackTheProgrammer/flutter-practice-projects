import 'package:flutter/material.dart';

import '/widgets/common/contact_screen.dart';
import '/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({ Key? key }) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: const Text(
            "WhatsApp",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
          bottom: const TabBar(
            indicatorColor: tabColor,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 4,
            labelColor: tabColor,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold
            ),
            tabs: [
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ]
          ),
        ),
        body: const ContactsScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: const Icon(
            Icons.contact_page, 
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}