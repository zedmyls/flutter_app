import 'package:get/get.dart';

import '../controllers/home_search_controller.dart';

class HomeSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSearchController>(
      () => HomeSearchController(),
    );
  }
}
