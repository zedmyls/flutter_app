import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/mixins/get_index_list_mixin.dart';
import 'package:flutter_app/app/modules/tabs/category/views/category_view.dart';
import 'package:flutter_app/app/modules/tabs/home/views/home_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/views/setting_view.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/views/shopcart_view.dart';
import 'package:get/get.dart';

class TabsController extends GetxController with GetIndexListMixin<Widget> {
  final pageController = PageController();

  final List<BottomNavigationBarItem> tabs = [
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
      icon: Icon(Icons.shopping_cart),
    ),
    BottomNavigationBarItem(
      label: '我的',
      icon: Icon(Icons.account_circle_rounded),
    ),
  ];

  final _pages = [
    HomeView(),
    CategoryView(),
    ShopcartView(),
    SettingView(),
  ];

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
