import 'package:get/get.dart';

import '../controllers/account_setting_controller.dart';

class AccountSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountSettingController>(
      () => AccountSettingController(),
    );
  }
}
