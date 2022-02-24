import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:get/get.dart';

class GeneralSettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '通用设置',
        context: context,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            ListTile(
              onTap: () {},
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Payment Details"),
            ),
            ListTile(
              leading: Image(
                image: AssetImage(
                  'assets/images/tabs/profile/${context.isDarkMode ? 'dark' : 'bright'}.png',
                ),
                width: 30,
                fit: BoxFit.fitWidth,
              ),
              trailing: Switch(
                onChanged: (bool value) {
                  Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                value: context.isDarkMode,
              ),
              title: Text("夜间模式"),
            ),
            Obx(
              () => Get.find<UserController>().isLogin
                  ? ListTile(
                      onTap: () {
                        Get.find<UserController>().logout();
                        showSuccessMessage('已退出登录');
                      },
                      leading: Image(
                        image: AssetImage(
                          'assets/images/tabs/profile/exit.png',
                        ),
                        width: 30,
                        fit: BoxFit.fitWidth,
                      ),
                      title: Text("退出登录"),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
