import 'dart:async';

import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class StartController extends GetxController {
  final _countDown = 3.obs;
  late final Timer? _timer;

  int get countDown => _countDown.value;

  @override
  void onInit() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countDown.value <= 1) {
        goHome();
      }
      ;
      _countDown.value--;
    });

    super.onInit();
  }

  goHome() {
    _timer?.cancel();
    Get.offAndToNamed(Routes.TABS);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
