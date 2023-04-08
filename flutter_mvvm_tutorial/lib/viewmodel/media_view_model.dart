import 'package:flutter/material.dart';
import '/model/repository/media_repository.dart';
import '/model/apis/api_response.dart';
import '/model/media.dart';

class MediaViewModel extends ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("INITIAL STAGE");

  ApiResponse get response => _apiResponse;

  Media? _media;

  Media? get media => _media;

  Future<void> getSong(String value) async {
    _apiResponse = ApiResponse.loading("LOADING");
    notifyListeners();
    try {
      List<Media> mediaResponses = await MediaRepository().getSongsList(value);
      _apiResponse = ApiResponse.completed(mediaResponses);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  void selectedMedia(Media? media) {
    _media = media;
    notifyListeners();
  }
}
