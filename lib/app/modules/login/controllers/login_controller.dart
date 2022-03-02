import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/common/mixins/get_params_mixin.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/login/login_request_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with GetParamsMixin<LoginRequest> {
  String get url => 'login';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    if (!formKey.currentState!.validate()) return;
    loadingToast(
      () => HttpUtils.instance.post(
        url,
        data: params.toJson(),
      ),
      successCallback: (res) {
        Get.find<UserController>().token = res!.data['token'];
        Get.back();
        showSuccessMessage(res.data['message']);
      },
    );
  }

  @override
  LoginRequest initParams() => LoginRequest();
}
