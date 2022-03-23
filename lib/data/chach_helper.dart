import 'package:shared_preferences/shared_preferences.dart';

class CahchHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({required key, dynamic value}) async {
    if (value is String)
      return await sharedPreferences.setString(key, value);
    else if (value is int)
      return await sharedPreferences.setInt(key, value);
    else if (value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  static getData({required String key}) async {
    return await sharedPreferences.get(key);
  }
}
