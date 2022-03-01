import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:get/get.dart';

class ShopcartController extends GetxController {
  UserController get _controller => Get.find();
  final cartList = [].obs;
  final _totalPrice = 0.obs;
  var goodsIds = <String>[].obs;

  String get url => 'carts';
  bool get isCheckedAll => goodsIds.length == cartList.length;
  int get totalPrice => _totalPrice.value;
  int get totalCount => cartList.length;

  checkAll() {
    if (isCheckedAll) {
      goodsIds.value = [];
    } else {
      goodsIds.value = cartList.map((element) => element.goodsId.id_ as String).toList();
    }

    // 改变选中状态
    loadingToast(
      () => HttpUtils.instance.patch(
        url,
        data: {
          'goods_ids': goodsIds,
        },
      ),
      successCallback: (res) {
        if (res!.statusCode == 200) {
          loadingToast(() => load());
        }
      },
    );
  }

  // 改变数量
  changeGoodsNum(String goodsId, int num) async {
    loadingToast(
      () => HttpUtils.instance.put(
        '$url/$goodsId',
        data: {
          'num': num,
        },
      ),
      successCallback: (res) {
        if (res!.statusCode == 201) {
          loadingToast(() => load());
        }
      },
    );
  }

  // 改变选中状态
  toggleCheckStatus(String _id, bool flag) {
    loadingToast(
      () => HttpUtils.instance.patch(
        url,
        data: {
          'goods_ids': flag ? (goodsIds..add(_id)) : (goodsIds..remove(_id)),
        },
      ),
      successCallback: (res) {
        if (res!.statusCode == 200) {
          loadingToast(() => load());
        }
      },
    );
  }

  // 移除购物车
  deleteCartItem(String goodsId) {
    loadingToast(
      () => HttpUtils.instance.delete('$url/$goodsId'),
      successCallback: (res) {
        if (res!.statusCode == 204) {
          loadingToast(() => load());
        }
      },
    );
  }

  load() async {
    final res = await HttpUtils.instance.get(url);
    cartList.value = res.data['cartList']
        .map(
          (item) => CartItemModel.fromJson(item),
        )
        .toList();
    _totalPrice.value = res.data['totalPrice'];

    goodsIds.clear();
    for (var element in cartList) {
      if (element.isChecked) {
        goodsIds.add(element.goodsId.id_);
      }
    }
  }

  @override
  void onInit() {
    if (_controller.isLogin) {
      loadingToast(() => load());
    }
    super.onInit();
  }
}
