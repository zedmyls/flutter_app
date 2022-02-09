import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/app_binding.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: AppBinding(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // 初始化 toast
      builder: EasyLoading.init(),
    ),
  );
}
