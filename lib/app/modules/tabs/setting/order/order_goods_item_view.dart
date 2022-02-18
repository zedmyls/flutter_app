import 'package:flutter/material.dart';

import '../../../../common/constant.dart';
import '../../shopcart/cart_item_model.dart';

class OrderGoodsItemView extends StatelessWidget {
  final CartItemModel item;

  const OrderGoodsItemView(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: Image.network(
              item.goodsId != null ? item.goodsId!.coverUrl! : defaultNetworkImg,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.goodsId != null ? item.goodsId!.title! : '', maxLines: 2),
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "￥${item.goodsId != null ? item.goodsId!.price! : 0}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('x${item.num!}'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
