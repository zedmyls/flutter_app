import 'package:get/get.dart';

import '../controllers/update_info_controller.dart';

class UpdateInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateInfoController>(
      () => UpdateInfoController(),
    );
  }
}
