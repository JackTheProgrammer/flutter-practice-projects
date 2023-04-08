import 'package:flutter/material.dart';

import '/utils/colors.dart';

class WebAppBar extends StatefulWidget {
  const WebAppBar({ Key? key }) : super(key: key);

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.077,
      padding: const EdgeInsets.all(10),
      color: webAppBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"
            ),
            radius: 30,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
          const Text("Albert Dera"),
          Row(
            children: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(
                  Icons.message, 
                  color: Colors.grey
                )
              ),
              IconButton(
                onPressed: (){}, 
                icon: const Icon(
                  Icons.more_vert, 
                  color: Colors.grey,
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}