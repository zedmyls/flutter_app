import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/enum/order_status.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_detail/controllers/order_detail_controller.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_goods_item_view.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:get/get.dart';

import '../../../../../../common/views/my_app_bar.dart';
import '../../../address_list/views/addr_item_view.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        titleWidget: Obx(
          () => Text(
            OrderStatus.values[controller.status - 1].value,
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Obx(
              () => Container(
                color: Get.isDarkMode ? Color(0xff404040) : Colors.white,
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
                      controller.order.orderDetail?.goodsList![index] ?? CartItemModel(),
                    );
                  },
                  itemCount: controller.order.orderDetail?.goodsList!.length,
                ),
              ),
            ),
            Container(
              color: Get.isDarkMode ? Color(0xff404040) : Colors.white,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          "订单编号：",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() => Text(controller.order.orderNo ?? '')),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          "下单日期：",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() => Text(controller.order.createAt ?? '')),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(
                          "支付方式：",
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
                          "配送方式：",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() => Text(controller.order.expressType ?? '')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => _buildBottomActions(),
      ),
    );
  }

  // 删除按钮
  Widget _buildDelButton() {
    return ElevatedButton(
      onPressed: () {
        controller.deleteOrder();
      },
      child: Text('删除订单'),
    );
  }

  // 修改地址按钮
  Widget _buildAddrButton() {
    return ElevatedButton(
      onPressed: () {
        controller.selectAddr();
      },
      child: Text('修改地址'),
    );
  }

  Widget _buildBottomActions() {
    int status = controller.status;

    if (status == OrderStatus.waitingPay.status) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildDelButton(),
          SizedBox(width: 10),
          _buildAddrButton(),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              controller.pay();
            },
            child: Text('付款'),
          ),
        ],
      );
    } else if (status == OrderStatus.waitingSend.status) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildAddrButton(),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              controller.remindDelivery();
            },
            child: Text('提醒发货'),
          ),
        ],
      );
    } else if (status == OrderStatus.waitingReceive.status) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              controller.receive();
            },
            child: Text('确认收货'),
          ),
        ],
      );
    } else if (status == OrderStatus.completed.status) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('再次购买'),
          ),
          SizedBox(width: 10),
          _buildDelButton(),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('去评价'),
          ),
        ],
      );
    } else if (status == OrderStatus.close.status) {}

    return Container();
  }
}
