import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AccountSettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '账户设置',
        context: context,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Obx(
              () => ListTile(
                onTap: Get.find<UserController>().user.safeLevel! == 0
                    ? () {
                        if (Get.find<UserController>().user.safeLevel == 0) {
                          Get.toNamed(Routes.VERIFY_EMAIL);
                        }
                      }
                    : null,
                leading: Get.find<UserController>().user.safeLevel! == 0
                    ? Icon(
                        Icons.warning_amber_outlined,
                        color: Color(0xFFED2F2F),
                      )
                    : Icon(
                        Icons.check_circle_outline,
                        color: Colors.grey,
                      ),
                title: Get.find<UserController>().user.safeLevel == 0
                    ? Text(
                        "验证邮箱",
                        style: TextStyle(
                          color: Color(0xFFED2F2F),
                        ),
                      )
                    : Text(
                        '邮箱已验证',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.account_balance_wallet),
              title: Text("修改登录密码"),
            ),
          ],
        ),
      ),
    );
  }
}
