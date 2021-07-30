import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil{
  static StorageUtil? _storageUtil;
  static SharedPreferences? _preferences;
  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }
  StorageUtil._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // get string
  static String? getString(String key) {
    return _preferences?.getString(key);
  }

  // put string
  static Future<bool?>? putString(String key, String value) {
    return _preferences?.setString(key, value);
  }

  // clear string
  static Future<bool?>? removeString(String key) {
    SharedPreferences prefs = _preferences!;
    return prefs.remove("$key");
  }
}