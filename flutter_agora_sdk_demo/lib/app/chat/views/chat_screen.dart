import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

import '/config/config.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: appID, 
      tempToken: tempToken,
      channelName: channelName
    )
  );
  
  @override
  void initState() {
    super.initState();
    _initAgora();
  }
  
  void _initAgora() async {
    await client.initialize();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AgoraVideoViewer(
              client: client,
              layoutType: Layout.floating,
              enableHostControls: true, // Add this to enable host controls
            ),
            AgoraVideoButtons(
              client: client,
            ),
          ],
        )
      )
    );
  }
}