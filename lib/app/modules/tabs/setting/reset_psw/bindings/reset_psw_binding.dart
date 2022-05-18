import 'package:get/get.dart';

import '../controllers/reset_psw_controller.dart';

class ResetPswBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPswController>(
      () => ResetPswController(),
    );
  }
}
