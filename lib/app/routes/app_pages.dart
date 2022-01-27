import 'package:flutter_app/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_app/app/modules/login/views/login_view.dart';
import 'package:flutter_app/app/modules/tabs/category/views/category_view.dart';
import 'package:flutter_app/app/modules/tabs/home/views/home_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/views/setting_view.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/views/shopcart_view.dart';
import 'package:flutter_app/app/modules/tabs/views/tabs_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TABS,
      page: () => TabsView(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
        ),
        GetPage(
          name: _Paths.SETTING,
          page: () => SettingView(),
        ),
        GetPage(
          name: _Paths.SHOPCART,
          page: () => ShopcartView(),
        ),
        GetPage(
          name: _Paths.CATEGORY,
          page: () => CategoryView(),
        ),
      ],
    ),
  ];
}
