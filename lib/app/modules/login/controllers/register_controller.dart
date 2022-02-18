import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_app/app/modules/login/login_request_model.dart';
import 'package:get/get.dart';

class RegisterController extends LoginController {
  final confirmPwd = ''.obs;

  @override
  String get url => 'register';

  register() {
    if (params.username.isEmpty) {
      showErrorMessage('用户名不能为空');
    } else if (params.email!.isEmpty) {
      showErrorMessage('邮箱不能为空');
    } else if (params.password.isEmpty) {
      showErrorMessage('密码不能为空');
    } else if (confirmPwd.value != params.password) {
      showErrorMessage('两次密码需输入一致');
    } else {
      login();
    }
  }

  @override
  LoginRequest initParams() => LoginRequest(email: '');
}
