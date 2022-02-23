import 'package:flutter_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_app/app/modules/login/login_request_model.dart';
import 'package:get/get.dart';

class RegisterController extends LoginController {
  final confirmPwd = ''.obs;

  @override
  String get url => 'register';

  @override
  LoginRequest initParams() => LoginRequest(email: '');
}
