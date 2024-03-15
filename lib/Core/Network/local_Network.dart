import 'package:shared_preferences/shared_preferences.dart';

/*String token = CacheNetwork.getCachedata(key: 'token');
String user= CacheNetwork.getCachedata(key: "password");
String password=CacheNetwork.getCachedata(key: "user");*/
String? token;
String? user;
String? password;

class CacheNetwork {
  static late SharedPreferences sharedPref;
  static cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> insertToCache(
      {required String key, required String value}) async {
    return await sharedPref.setString(key, value);
  }

  static String getCachedata({required String key}) {
    return sharedPref.getString(key) ?? '';
  }

  static Future<bool> deleteCacheItem() async {
    return await sharedPref.clear();
  }
}
