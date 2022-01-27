import 'package:flutter_app/app/common/mixins/get_params_mixin.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/login/login_request_model.dart';
import 'package:flutter_app/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with GetParamsMixin<LoginRequest> {
  String get url => 'login';

  login() async {
    final res = await HttpUtils.instance.post(url, data: params.toJson());
    Get.find<UserController>().token = res.data['token'];
    showSuccessMessage(res.data['message']);
    await Get.offAllNamed(Routes.TABS);
    print(Get.find<TabsController>().index);
  }

  @override
  LoginRequest initParams() => LoginRequest();
}
