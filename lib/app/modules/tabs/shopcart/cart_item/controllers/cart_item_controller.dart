import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:get/get.dart';

class CartItemController extends GetxController {
  String get url => 'carts';

  final CartItemModel item;
  final _goodsNum = 0.obs;
  final _isChecked = false.obs;
  late String _id;

  ShopcartController get _controller => Get.find();

  CartItemController(this.item);

  int get goodsNum => _goodsNum.value;
  bool get isChecked => _isChecked.value;

  set goodsNum(int num) {
    _goodsNum.value = num;
  }

  set isChecked(bool flag) {
    _isChecked.value = flag;
    if (flag) {
      _controller.goodsIds.add(_id);
    } else {
      _controller.goodsIds.remove(_id);
    }
  }

  // 改变数量
  changeGoodsNum(String goodsId, bool isAdd) async {
    loadingToast(
      () => HttpUtils.instance.put(
        '$url/$goodsId',
        data: {
          'num': isAdd ? goodsNum + 1 : goodsNum - 1,
        },
      ),
      successCallback: (res) {
        if (res.statusCode == 201) {
          isAdd ? goodsNum++ : goodsNum--;
        }
      },
    );
  }

  // 改变选中状态
  toggleCheckStatus() {
    loadingToast(
      () => HttpUtils.instance.patch(
        url,
        data: {
          'goods_ids': _controller.goodsIds,
        },
      ),
      successCallback: (res) {
        if (res.statusCode == 200) {
          isChecked = !isChecked;
        }
      },
    );
  }

  // 移除购物车
  deleteCartItem(String goodsId) {
    loadingToast(
      () => HttpUtils.instance.delete('$url/$goodsId'),
      successCallback: (res) {
        if (res.statusCode == 204) {
          _controller.load();
        }
      },
    );
  }

  @override
  void onReady() {
    _id = item.goodsId!.id_!;
    goodsNum = item.num!;
    isChecked = item.isChecked!;
    super.onReady();
  }
}
