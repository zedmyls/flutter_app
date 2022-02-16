import 'package:get/get.dart';

import '../controllers/order_preview_controller.dart';

class OrderPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderPreviewController>(
      () => OrderPreviewController(),
    );
  }
}
