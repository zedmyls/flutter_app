import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:get/get.dart';

class ShopcartController extends GetxController {
  UserController get _controller => Get.find();
  final cartList = [].obs;

  String get url => 'carts';

  load() async {
    final res = await HttpUtils.instance.get(url);
    cartList.value = res.data['cartList']
        .map(
          (item) => CartItemModel.fromJson(item),
        )
        .toList();
  }

  @override
  void onInit() {
    if (_controller.isLogin) {
      load();
    }
    super.onInit();
  }
}
