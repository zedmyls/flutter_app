import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';
import 'package:get/get.dart';

class HomeBannerController extends GetxController {
  String get url => 'index';
  final _banner = [].obs;

  List get banner => _banner;

  load() async {
    final res = await HttpUtils.instance.get(url);
    _banner.value = res.data['swipers']
        .map(
          (item) => GoodsItemModel.fromJson(item),
        )
        .toList();
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
