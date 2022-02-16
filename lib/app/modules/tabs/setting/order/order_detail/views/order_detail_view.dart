import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_detail/controllers/order_detail_controller.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_goods_item_view.dart';
import 'package:get/get.dart';

import '../../../../../../common/views/my_app_bar.dart';
import '../../../address_list/views/addr_item_view.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          '订单详情',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: AddrItemView(controller.addr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              constraints: BoxConstraints(maxHeight: 300),
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return OrderGoodsItemView(
                      controller.cartList[index],
                    );
                  },
                  itemCount: controller.cartList.length,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          "订单编号:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("124215215xx324")
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          "下单日期:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("2019-12-09")
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          "支付方式:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("微信支付"),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          "配送方式:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("顺丰"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
