import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/addr_model.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OrderPreviewController extends GetxController {
  String get url => 'orders';
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
      () => HttpUtils.instance.get('$url/preview'),
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
    final result = await Get.toNamed(Routes.ADDRESS_LIST, arguments: 'select');
    if (result != null) {
      _hasDefaultAddr.value = true;
      _defaultAddr.value = result;
    }
  }

  // 确认订单
  submit() {
    if (hasDefaultAddr) {
      loadingToast(
        () => HttpUtils.instance.post(
          '$url/new', // 暂时的接口
          data: {
            'address_id': defaultAddr.id,
          },
        ),
        successCallback: (res) {
          Get.find<ShopcartController>().load();
          Get.offAndToNamed(Routes.ORDER_DETAIL, arguments: res.data['id']);
        },
      );
    }
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
