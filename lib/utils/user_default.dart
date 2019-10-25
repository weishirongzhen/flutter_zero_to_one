import 'package:shared_preferences/shared_preferences.dart';

class UserDefault {
  static SharedPreferences pre;

  static Future init() async {
    pre = await SharedPreferences.getInstance();
    return Future.value(null);
  }

  /////////////////////////

  ///保存token
  static void saveToken(String token) async {
    await pre.setString("access_token", token);
  }

  static Future<String> getToken() async {

    return pre.getString("access_token");
  }

  static Future<bool> removeToken() async {
    return pre.remove("access_token");
  }

  static void saveHistory(){

  }




}
