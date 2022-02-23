import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/common/mixins/get_params_mixin.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/login/login_request_model.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
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
        Get.find<UserController>().token = res.data['token'];
        showSuccessMessage(res.data['message']);
        Get.find<UserController>().load();
        Get.find<ShopcartController>().load();
        Get.offAllNamed(Routes.TABS);
      },
    );
  }

  @override
  LoginRequest initParams() => LoginRequest();
}
