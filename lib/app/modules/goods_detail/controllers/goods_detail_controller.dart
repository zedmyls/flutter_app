import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
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

  // 添加到购物车
  addToCart() async {
    final res = await HttpUtils.instance.post('carts', data: {
      'num': 1,
      '_id': detail.id_,
    });

    // 后端是我之前写的，烂！
    if (res.statusCode == 201) {
      showSuccessMessage(res.data['message']);
      Get.find<ShopcartController>().load();
      // todo 刷新购物车数量
    }
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
