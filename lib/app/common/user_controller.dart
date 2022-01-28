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
    _token.value = token;
  }

  load() async {
    if (isLogin) {
      final res = await HttpUtils.instance.get(url);
      _user.value = UserModel.fromJson(res.data!['user']);
    }
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
