import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void showErrorMessage(String message) {
  Get.snackbar(
    'Error:',
    message,
    duration: Duration(milliseconds: 1500),
    colorText: Colors.red,
    isDismissible: true,
    icon: Icon(
      Icons.error_outline,
      color: Colors.red,
    ),
  );
}

void showSuccessMessage(String message) {
  Get.snackbar(
    'Success:',
    message,
    duration: Duration(milliseconds: 1500),
    colorText: Colors.greenAccent,
    isDismissible: true,
    icon: Icon(
      Icons.check_circle_outline,
      color: Colors.greenAccent,
    ),
  );
}

String formatStarCount(int count) {
  if (count < 1000) {
    return count.toString();
  } else {
    return '${(count / 1000).toStringAsFixed(1)}k';
  }
}

// 带 loading_toast 的 请求
loadingToast(Future Function() request, {Function(dio.Response res)? successCallback}) async {
  EasyLoading.show();
  final res = await request();
  EasyLoading.dismiss();
  if (successCallback != null) successCallback(res);
}
