import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/modules/login/views/welcome_view.dart';
import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<UserController>().isLogin ? Container() : WelcomePage(),
    );
  }
}
