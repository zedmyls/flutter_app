import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

/// snackBar 错误通知
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

/// snackBar 成功通知
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

/// 将整数变为类似github收藏数的显示方式
String formatStarCount(int count) {
  if (count < 1000) {
    return count.toString();
  } else {
    return '${(count / 1000).toStringAsFixed(1)}k';
  }
}

/// 带 loading_toast 的 请求
loadingToast(Future Function() request, {Function(dio.Response res)? successCallback}) async {
  EasyLoading.instance.userInteractions = false; // loading时，禁止用户操作
  EasyLoading.show();
  final res = await request();
  EasyLoading.dismiss();
  if (successCallback != null) successCallback(res);
}

/// 确认弹窗
confirmDialog({
  required String title,
  required String msg,
  Widget? content,
  VoidCallback? onCancel,
  VoidCallback? onConfirm,
}) {
  Get.defaultDialog(
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                '取消',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                if (onCancel != null) onCancel();
                Get.back();
              },
            ),
            TextButton(
              child: Text(
                '确认',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                if (onConfirm != null) onConfirm();
                Get.back();
              },
            ),
          ],
        ),
      ),
    ],
    title: title,
    titleStyle: TextStyle(color: Colors.red),
    content: Column(
      children: [
        Text(msg),
        SizedBox(height: 10),
        content ?? Container(),
      ],
    ),
  );
}
