import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HttpUtils {
  static Dio? _dio;
  static Dio get instance => _getInstance();

  static _getInstance() {
    if (_dio == null) {
      _dio ??= Dio();

      _dio!.options.baseUrl = 'http://localhost:3000/api/';
      _dio!.options.connectTimeout = 10000;

      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, handler) {
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
            return;
          },
        ),
      );
    }

    return _dio!;
  }
}
