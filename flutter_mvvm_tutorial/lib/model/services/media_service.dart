import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '/model/services/base_services.dart';
import '../apis/app_exceptions.dart';

class MediaService implements BaseServices {
  final String _mediaBaseUrl = "https://itunes.apple.com/search?term=";

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(_mediaBaseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occurred while communication with server with status code : ${response.statusCode}'
        );
    }
  }
}
