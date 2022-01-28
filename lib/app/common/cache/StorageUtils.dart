import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static SharedPreferences? _instance;

  static SharedPreferences get db {
    _getInstance();
    return _instance!;
  }

  static _getInstance() async {
    _instance ??= await SharedPreferences.getInstance();
  }
}
