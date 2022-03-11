import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/app_binding.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'app/common/cache/storage_utils.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化缓存管理器
  await StorageUtils.init();
  // 检查主题色
  bool? isDarkMode = StorageUtils.db.getBool('cache-is_dark_mode-key');
  if (isDarkMode != null) Get.changeTheme(isDarkMode ? ThemeData.dark() : ThemeData.light());

  runApp(
    GetMaterialApp(
      initialBinding: AppBinding(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      // 初始化 toast
      builder: EasyLoading.init(),
    ),
  );
}
