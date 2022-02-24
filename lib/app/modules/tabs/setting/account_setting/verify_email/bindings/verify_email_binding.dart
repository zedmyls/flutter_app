import 'package:get/get.dart';

import '../controllers/verify_email_controller.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailController>(
      () => VerifyEmailController(),
    );
  }
}
