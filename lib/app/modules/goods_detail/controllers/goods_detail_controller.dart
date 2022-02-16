import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/controllers/star_list_controller.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:get/get.dart';

class GoodsDetailController extends GetxController {
  final _detail = GoodsItemModel().obs;
  final _likeGoods = [].obs;
  final _isCollected = false.obs;

  GoodsItemModel get detail => _detail.value;

  List get likeGoods => _likeGoods;
  bool get isCollected => _isCollected.value;

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
    }
  }

  // 查询该商品是否被收藏
  getCollectStatus() async {
    final res = await HttpUtils.instance.get('collect/${Get.arguments}');
    _isCollected.value = res.data['isCollected'];
  }

  // 收藏，取消收藏
  toggleCollectStatus() {
    loadingToast(
      () => HttpUtils.instance.post(
        'collect',
        data: {
          'goods_id': detail.id_,
        },
      ),
      successCallback: (res) {
        showSuccessMessage(res.data['message']);
        _isCollected.value = !_isCollected.value;

        if (Get.isRegistered<StarListController>()) {
          Get.find<StarListController>().refreshList();
        }
      },
    );
  }

  @override
  void onInit() {
    load();
    if (Get.find<UserController>().isLogin) {
      getCollectStatus();
    }

    super.onInit();
  }
}
