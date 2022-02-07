import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorMessage(String message) {
  Get.snackbar(
    'Error:',
    message,
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
