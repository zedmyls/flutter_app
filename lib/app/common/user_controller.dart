import 'package:get/get.dart';

class UserController extends GetxController {
  final _token = ''.obs;

  bool get isLogin => _token.value.isNotEmpty;
  String get token => _token.value;

  set token(String token) {
    _token.value = token;
  }
}
