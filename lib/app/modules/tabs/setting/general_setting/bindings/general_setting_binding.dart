import 'package:get/get.dart';

import '../controllers/general_setting_controller.dart';

class GeneralSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneralSettingController>(
      () => GeneralSettingController(),
    );
  }
}
