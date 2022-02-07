import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';
import 'package:get/get.dart';

class GoodsDetailController extends GetxController {
  final _detail = GoodsItemModel().obs;
  final _likeGoods = [].obs;

  GoodsItemModel get detail => _detail.value;

  List get likeGoods => _likeGoods;

  set detail(GoodsItemModel goods) {
    _detail.value = goods;
  }

  set likeGoods(List goodsList) {
    _likeGoods.value = goodsList;
  }

  load() async {
    final res = await HttpUtils.instance.get('detail/${Get.arguments}');
    detail = GoodsItemModel.fromJson(res.data['detail']);
    likeGoods = res.data['likeGoods'].map((item) => GoodsItemModel.fromJson(item)).toList();
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
