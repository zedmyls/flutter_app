import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';
import 'package:get/get.dart';

class HomeSearchController extends GetxController {
  final _list = <dynamic>[].obs;

  List get list => _list;

  load() {
    loadingToast(() => HttpUtils.instance.get('index_search/${Get.arguments}'), successCallback: (res) {
      _list.value = res!.data['result'].map((item) => GoodsItemModel.fromJson(item)).toList();
    });
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
