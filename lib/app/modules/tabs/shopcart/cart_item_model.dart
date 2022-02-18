import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';

class CartItemModel {
  GoodsItemModel? goodsId;
  int? num;
  bool? isChecked;

  CartItemModel({this.goodsId, this.num = -1, this.isChecked = false});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    goodsId = json['goods_id'] != null ? GoodsItemModel.fromJson(json['goods_id']) : null;
    num = json['num'];
    isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (goodsId != null) {
      data['goods_id'] = goodsId!.toJson();
    }
    data['num'] = num;
    data['isChecked'] = isChecked;
    return data;
  }
}
