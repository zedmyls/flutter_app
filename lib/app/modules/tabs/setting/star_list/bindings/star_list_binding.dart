import 'package:get/get.dart';

import '../controllers/star_list_controller.dart';

class StarListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StarListController>(
      () => StarListController(),
    );
  }
}
