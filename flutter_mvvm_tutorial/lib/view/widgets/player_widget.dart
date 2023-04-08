import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

enum PlayerState { stopped, playing, paused }
enum PlayingRouteState { speakers, earpiece }

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({ Key? key }) : super(key: key);

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}