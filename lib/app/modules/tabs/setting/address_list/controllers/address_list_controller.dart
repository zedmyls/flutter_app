import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/addr_model.dart';
import 'package:get/get.dart';

import '../../order/order_preview/controllers/order_preview_controller.dart';

class AddressListController extends GetxController {
  String get url => 'addr';

  final list = [].obs;
  var isSelectMode = false;

  load() async {
    loadingToast(() => HttpUtils.instance.get(url), successCallback: (res) {
      list.value = res.data['addrList'].map((item) => AddrModel.fromJson(item)).toList();
    });
  }

  // 删除地址
  deleteAddr(int id) {
    loadingToast(() => HttpUtils.instance.delete('$url/$id'), successCallback: (res) {
      loadingToast(() => load());
    });
  }

  @override
  void onInit() {
    if (Get.isRegistered<OrderPreviewController>()) {
      isSelectMode = true;
    }

    load();
    super.onInit();
  }
}
