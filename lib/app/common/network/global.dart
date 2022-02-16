import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HttpUtils {
  static Dio? _dio;
  static Dio get instance => _getInstance();

  static _getInstance() {
    if (_dio == null) {
      _dio ??= Dio();

      _dio!.options.baseUrl = 'http://localhost:3000/api/';
      _dio!.options.connectTimeout = 10000;

      final UserController _controller = Get.find();

      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, handler) {
            if (_controller.isLogin) {
              options.headers['Authorization'] = 'Bearer ${_controller.token}';
            }
            print('上传接口：${options.uri}');
            return handler.next(options);
          },
          onResponse: (res, handler) {
            return handler.next(res);
          },
          onError: (error, _) {
            if (error.response!.statusCode! >= 400) {
              Get.snackbar(
                'Error',
                error.response!.data['message'],
                colorText: Colors.red,
              );
            } else if (error.response != null &&
                error.response!.statusCode != null &&
                error.response!.statusCode! >= 500) {
              Get.snackbar('Error', '服务端错误，请稍后再试');
            } else {
              Get.snackbar(
                'Error',
                '请求失败：${error.message}',
                colorText: Colors.red,
              );
            }
            print(EasyLoading.isShow);
            if (EasyLoading.isShow) EasyLoading.dismiss();
            return;
          },
        ),
      );
    }

    return _dio!;
  }
}
