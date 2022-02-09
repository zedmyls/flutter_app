import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:get/get.dart';

class ShopcartController extends GetxController {
  UserController get _controller => Get.find();
  final cartList = [].obs;
  final totalPrice = 0.0.obs;
  final goodsIds = <String>[].obs;

  String get url => 'carts';

  bool get isCheckedAll => goodsIds.length == cartList.length;

  checkAll() {
    // 改变选中状态
    loadingToast(
      () => HttpUtils.instance.patch(
        url,
        data: {
          'goods_ids': cartList.map((element) => element.goodsId.id_).toList(),
        },
      ),
      // successCallback: (res) {
      //   if (res.statusCode == 200) {
      //     isChecked = !isChecked;
      //   }
      // },
    );
  }

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
