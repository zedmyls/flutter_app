import 'package:get/get.dart';

class LoginTabController extends GetxController {
  final _index = 0.obs;

  int get index => _index.value;

  set index(int i) {
    _index.value = i;
  }

  @override
  void onInit() {
    index = Get.arguments;
    super.onInit();
  }
}
