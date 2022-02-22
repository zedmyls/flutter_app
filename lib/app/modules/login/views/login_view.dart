import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/modules/login/controllers/login_tab_controller.dart';
import 'package:flutter_app/app/modules/login/views/login_view_ui.dart';
import 'package:flutter_app/app/modules/login/views/register_view_ui.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginTabController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        elevation: 0,
        context: context,
      ),
      body: Obx(
        () => controller.index == 0 ? LoginViewUI() : RegisterViewUI(),
      ),
    );
  }
}
