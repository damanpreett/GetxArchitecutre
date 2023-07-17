import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static SharedPreferences? _prefsInstance;
  static Future<SharedPreferences?> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }
  static  Future<Object> setString(String key,String value) async {
    return await _prefsInstance?.setString(key, value) ?? "";
  }
  static Future<String> getString(String key, [String? defValue])async {
    return _prefsInstance?.getString(key) ?? defValue ?? "";
  }
  static  Future<Object> setInt(String key,int value) async {
    return await _prefsInstance?.setInt(key, value) ?? 0;
  }
  static Future<int> getInt(String key, [int? defValue]) async{
    return  _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }
 static  Future<Object> setDouble(String key,double value) async {
    return await _prefsInstance?.setDouble(key, value) ?? 0;
  }
  static Future<double> getDouble(String key, [double? defValue]) async{
    return  _prefsInstance?.getDouble(key) ?? defValue ?? 0;
  }

  static Future<bool> setBools(String key, bool defValue) async {
    return await _prefsInstance!.setBool(key, defValue);
  }

  static Future<bool> getBoolean(String key)  async{
    return   _prefsInstance?.getBool(key) ?? false;
  }
  static  Future<Object> setStringList(String key,List<String> value) async {
    return await _prefsInstance?.setStringList(key, value) ?? "";

  }
  static Future<List<String>> getStringList(String key, [List<String>? defValue]) async{
    return  _prefsInstance?.getStringList(key) ?? defValue ?? [];
  }
  static Future? clearSharePref() {
    _prefsInstance!.clear();
    return null;
  }
}