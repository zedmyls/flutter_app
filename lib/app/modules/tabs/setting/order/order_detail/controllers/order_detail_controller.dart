import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/addr_model.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  final _cartList = [].obs;
  final _addr = AddrModel().obs;

  get cartList => _cartList;
  AddrModel get addr => _addr.value;
  String get url => 'order';

  load() {
    loadingToast(() => HttpUtils.instance.get('$url/${Get.arguments}'), successCallback: (res) {
      // res.data
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
