import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class MyTabBar<T extends HomeController> extends StatelessWidget {
  final bool isScrollable;
  const MyTabBar({Key? key, this.isScrollable = false}) : super(key: key);
  T get _controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Color(0xff303030) : Color(0xfff9f9f9),
      ),
      width: Get.width,
      height: 50,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: TabBar(
        isScrollable: isScrollable,
        controller: _controller.tabController,
        tabs: _controller.tabs
            .map(
              (e) => Tab(
                child: Text(
                  e.key!,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
