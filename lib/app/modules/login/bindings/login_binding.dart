import 'package:flutter_app/app/modules/login/controllers/login_tab_controller.dart';
import 'package:flutter_app/app/modules/login/controllers/register_controller.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginTabController>(
      () => LoginTabController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
