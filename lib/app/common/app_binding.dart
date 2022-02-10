import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/modules/tabs/category/controllers/category_controller.dart';
import 'package:flutter_app/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:flutter_app/app/modules/tabs/home/controllers/home_controller.dart';
import 'package:flutter_app/app/modules/tabs/setting/controllers/setting_controller.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(SettingController(), permanent: true);
    Get.put(CategoryController(), permanent: true);

    // 这两个Controller的put先后顺序不能变
    Get.put(ShopcartController(), permanent: true);
    Get.put(TabsController(), permanent: true);
  }
}
