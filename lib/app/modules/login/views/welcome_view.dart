import 'package:flutter/material.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 32, bottom: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  width: 250,
                  child: TextButton(
                    child: Text('登录', style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN, arguments: 0);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 16),
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    border: Border.all(color: Theme.of(context).colorScheme.secondary),
                    // shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  width: 250,
                  child: TextButton(
                    child: Text(
                      '注册',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN, arguments: 1);
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
