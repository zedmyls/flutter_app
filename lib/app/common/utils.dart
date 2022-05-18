import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/BottomSheetView.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

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
loadingToast(Future Function() request, {Function(dio.Response? res)? successCallback}) async {
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
                  color: Get.isDarkMode ? Colors.white : Colors.black,
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

/// format
class FormatUtils {
  FormatUtils._();

  // 保留两位小数
  static String formatMoney(int money) {
    if (money < 1000) return NumberFormat('0.00').format(money);
    return NumberFormat('0,000.00').format(money);
  }

  // 格式化时间
  static String formatTime(String time) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.parse(time));
  }
}

/// bottomSheet
showMyBottomSheet(List<BottomSheetItem> list) {
  Get.bottomSheet(
    BottomSheetView(list),
    isScrollControlled: true,
  );
}

Future<void> launch(String url) async {
  /// 先判断是否可以launch url
  if (await UrlLauncherPlatform.instance.canLaunch(url)) {
    /// 如果可以则启动
    await UrlLauncherPlatform.instance.launch(
      url,
      useSafariVC: false,
      useWebView: false,
      enableJavaScript: false,
      enableDomStorage: false,
      universalLinksOnly: false,
      headers: <String, String>{},
    );
  } else {
    print("Cannot Launch Url");
  }
}
