import 'package:flutter/material.dart';
import '/utils/colors.dart';

class WebProfileBar extends StatefulWidget {
  const WebProfileBar({ Key? key }) : super(key: key);

  @override
  State<WebProfileBar> createState() => _WebProfileBarState();
}

class _WebProfileBarState extends State<WebProfileBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: MediaQuery.of(context).size.height * 0.077,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: dividerColor,
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://www.socialketchup.in/wp-content/uploads/2020/05/fi-vill-JOHN-DOE.jpg"
            ),
            radius: 20,
          ),
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