class AppUser {
  String userName = "";
  String appUserName = "";
  String userPassword = "";

  AppUser(
    this.userName,
    this.appUserName,
    this.userPassword,
  );

  factory AppUser.fromJson(Map json) {
    return AppUser(
      json['username'] ?? "",
      json['appusername'] ?? "",
      json['userpassword'] ?? ""
    );
  }

  Map toJson() {
    return {
      "username": userName,
      "appusername": appUserName,
      "userpassword": userPassword,
    };
  }
}
