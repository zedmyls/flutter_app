import 'package:flutter/material.dart';
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
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            ListTile(
              onTap: () {},
              leading: Icon(Icons.edit),
              title: Text("My Orders"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.favorite_border),
              title: Text("My Favorite"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Payment Details"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(context.isDarkMode ? Icons.dark_mode : Icons.light_mode),
              trailing: Switch(
                onChanged: (bool value) {
                  Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                value: context.isDarkMode,
              ),
              title: Text("My Account"),
            ),
          ],
        ),
      ),
    );
  }
}
