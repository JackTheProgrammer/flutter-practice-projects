import '/model/media.dart';
import '/model/services/base_services.dart';
import '/model/services/media_service.dart';

class MediaRepository {
  BaseServices baseServices = MediaService();
  Future<List<Media>> getSongsList(String value) async {
    dynamic response = await baseServices.getResponse(value);
    List responseData = response[''] as List;
    return responseData.map(
      (datum) => Media.fromJson(datum)
    ).toList();
  }
}
