import 'package:flutter_app/app/common/models/user_model.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:get/get.dart';

import 'cache/storage_utils.dart';

class UserController extends GetxController {
  String get url => 'user';
  final _user = UserModel().obs;
  final _avatar = ''.obs;

  UserModel get user => _user.value;

  final _token = ''.obs;

  bool get isLogin => _token.value.isNotEmpty;
  String get token => _token.value;

  set avatar(String url) {
    _avatar.value = url;
  }

  String get avatar => _avatar.value;

  set token(String token) {
    _setToken();
    _token.value = token;
  }

  load() async {
    final res = await HttpUtils.instance.get(url);
    _user.value = UserModel.fromJson(res.data!['user']);
    avatar = _user.value.avatar!;
  }

  // 注销登录
  logout() {
    _token.value = '';
    StorageUtils.db.setString('cache-token-key', '');
    Get.find<ShopcartController>().cartList.clear();
    _user.value = UserModel();
  }

  @override
  void onInit() {
    _initToken();
    super.onInit();
  }

  // 登录后
  _setToken() {
    StorageUtils.db.setString('cache-token-key', token);
    Get.find<UserController>().load();
    Get.find<ShopcartController>().load();
  }

  // 本地已经存在token
  _initToken() async {
    String? cacheToken = StorageUtils.db.getString('cache-token-key');

    if (cacheToken != null && cacheToken.isNotEmpty) {
      _token.value = cacheToken;

      load();
      if (Get.isRegistered<ShopcartController>()) {
        Get.find<ShopcartController>().load();
      }
    }
  }
}
