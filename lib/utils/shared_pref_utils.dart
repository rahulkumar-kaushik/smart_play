import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  Future<bool> setBool(String key, bool value) async {
    return instance.setBool(key, value);
  }

  static bool getBool(String key) => instance.getBool(key) ?? false;
}
