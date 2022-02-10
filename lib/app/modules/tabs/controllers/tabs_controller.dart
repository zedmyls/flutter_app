import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/mixins/get_index_list_mixin.dart';
import 'package:flutter_app/app/modules/tabs/category/views/category_view.dart';
import 'package:flutter_app/app/modules/tabs/home/views/home_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/views/setting_view.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/views/shopcart_view.dart';
import 'package:get/get.dart';

class TabsController extends GetxController with GetIndexListMixin<Widget> {
  final pageController = PageController();
  ShopcartController get cartController => Get.find();

  List<BottomNavigationBarItem> tabs = [];

  final _pages = [
    HomeView(),
    CategoryView(),
    ShopcartView(),
    SettingView(),
  ];

  @override
  void onInit() {
    tabs = [
      BottomNavigationBarItem(
        label: '首页',
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: '分类',
        icon: Icon(Icons.category),
      ),
      BottomNavigationBarItem(
        label: '购物车',
        icon: Obx(
          () => Badge(
            badgeContent: Text(
              cartController.totalCount.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Icon(Icons.shopping_cart),
            showBadge: cartController.totalCount > 0,
          ),
        ),
        activeIcon: Icon(Icons.shopping_cart),
      ),
      BottomNavigationBarItem(
        label: '我的',
        icon: Icon(Icons.account_circle_rounded),
      ),
    ];
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  set index(int i) {
    if (index != i) pageController.jumpToPage(i);
    super.index = i;
  }

  @override
  List<Widget> get indexList => _pages;

  // 返回首页
  goHome() {
    index = 0;
  }
}
