import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static Future<bool?> isAuthenticatedUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("isAuthenticated");
  }

  void authenticateUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isAuthenticated", true);
  }

  void unAuthenticateUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isAuthenticated", false);
  }

  void setAppUsername(String appusername) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("appusername", appusername);
  }

  static Future<String?> getAppUsername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("appusername");
  }
}
