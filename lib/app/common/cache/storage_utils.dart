import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  StorageUtils._();

  static SharedPreferences? _instance;

  static SharedPreferences get db {
    _instance ?? _getInstance();
    return _instance!;
  }

  static _getInstance() async {
    _instance = await SharedPreferences.getInstance();
  }

  static init() async {
    _instance = await SharedPreferences.getInstance();
  }
}
