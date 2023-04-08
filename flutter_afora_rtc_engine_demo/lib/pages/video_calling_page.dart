// ignore_for_file: library_prefixes
import 'dart:developer';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '/config/config.dart';

class VideoCallingPage extends StatefulWidget {
  const VideoCallingPage({Key? key}) : super(key: key);

  @override
  State<VideoCallingPage> createState() => _VideoCallingPageState();
}

class _VideoCallingPageState extends State<VideoCallingPage> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          log("local user $uid joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          log("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          log("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(tempToken, channelName, null, 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Video Call'),
      ),
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                  ? const RtcLocalView.SurfaceView()
                  : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid!,
        channelId: channelName,
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}