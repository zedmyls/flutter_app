import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/addr_model.dart';
import 'package:get/get.dart';

class AddressListController extends GetxController {
  String get url => 'addr';

  final list = [].obs;

  load() async {
    loadingToast(() => HttpUtils.instance.get(url), successCallback: (res) {
      list.value = res.data['addrList'].map((item) => AddrModel.fromJson(item)).toList();
    });
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
