import 'package:flutter_app/app/common/network/global.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  String get url => 'carts';

  final _goodsNum = 0.obs;

  CartItemController(int num) {
    goodsNum = num;
  }

  int get goodsNum => _goodsNum.value;

  set goodsNum(int num) {
    _goodsNum.value = num;
  }

  // 改变数量
  changeGoodsNum(String goodsId, bool isAdd) async {
    final res = await HttpUtils.instance.put('$url/$goodsId', data: {
      'num': isAdd ? goodsNum + 1 : goodsNum - 1,
    });

    if (res.statusCode == 201) {
      isAdd ? goodsNum++ : goodsNum--;
    }
  }
}
