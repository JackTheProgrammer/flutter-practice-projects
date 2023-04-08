import 'package:flutter/material.dart';

import '/utils/colors.dart';

class RecipientMessageCard extends StatelessWidget {
final String text, time;
  const RecipientMessageCard({
    Key? key,
    required this.text,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          color: senderMessageColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
                  bottom: 20
                ),
                child: Text(text, style: const TextStyle(fontSize: 16),)
              ),
              Positioned(
                right: 10,
                bottom: 2,
                child: Row(
                  children: [
                    Text(
                      time, 
                      style: const TextStyle(
                        fontSize: 13, 
                        color: Colors.white70
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Icon(Icons.done_all, size: 20, color: Colors.white70,)
                  ]
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}