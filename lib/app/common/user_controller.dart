import 'package:flutter_app/app/common/models/user_model.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  String get url => 'user';
  final _user = UserModel().obs;

  UserModel get user => _user.value;

  final _token = ''.obs;

  bool get isLogin => _token.value.isNotEmpty;
  String get token => _token.value;

  set token(String token) {
    // StorageUtils.db.setString('cache-token-key', token);
    _token.value = token;
  }

  load() async {
    if (isLogin) {
      final res = await HttpUtils.instance.get(url);
      _user.value = UserModel.fromJson(res.data!['user']);
    }
  }

  // 注销登录
  logout() {
    token = '';
  }

  @override
  void onInit() {
    // String? cacheToken = StorageUtils.db.getString('cache-token-key');
    // if (cacheToken != null) _token.value = cacheToken;

    load();
    super.onInit();
  }
}
