import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/addr_model.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OrderPreviewController extends GetxController {
  String get url => 'orders/preview';
  final _cartList = [].obs;
  // 如果没有默认地址，返回的是null
  final _defaultAddr = AddrModel().obs;
  final _hasDefaultAddr = false.obs;
  final _totalPrice = 0.obs;

  get cartList => _cartList;
  AddrModel get defaultAddr => _defaultAddr.value;
  bool get hasDefaultAddr => _hasDefaultAddr.value;
  int get totalPrice => _totalPrice.value;

  load() {
    loadingToast(
      () => HttpUtils.instance.get(url),
      successCallback: (res) {
        int sum = 0;
        _cartList.value = res.data['user']['cartList'].map(
          (item) {
            CartItemModel cartItem = CartItemModel.fromJson(item);
            sum += cartItem.num! * cartItem.goodsId!.price!;
            return cartItem;
          },
        ).toList();

        _totalPrice.value = sum;

        if (res.data['addr'] != null) {
          _hasDefaultAddr.value = true;
          _defaultAddr.value = AddrModel.fromJson(res.data['addr']);
        }
      },
    );
  }

  // 跳转到地址列表，返回选中的AddrModel
  selectAddr() async {
    final result = await Get.toNamed(Routes.ADDRESS_LIST);
    _defaultAddr.value = result;
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
