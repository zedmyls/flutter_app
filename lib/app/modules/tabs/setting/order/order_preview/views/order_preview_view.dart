import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/views/addr_item_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_goods_item_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_preview/controllers/order_preview_controller.dart';
import 'package:get/get.dart';

class OrderPreviewView extends GetView<OrderPreviewController> {
  OrderPreviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          '订单预览',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
            child: Obx(
              () => controller.hasDefaultAddr
                  ? AddrItemView(
                      controller.defaultAddr,
                      onTap: () {
                        controller.selectAddr();
                      },
                    )
                  : ListTile(
                      leading: Icon(Icons.add_location),
                      title: Text("请添加收货地址"),
                      trailing: Icon(Icons.navigate_next),
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            constraints: BoxConstraints(maxHeight: 300),
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return OrderGoodsItemView(controller.cartList[index]);
                },
                itemCount: controller.cartList.length,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('折扣：￥0'),
                Divider(),
                Text('运费：￥0'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('合计：'),
          Obx(
            () => Text(
              '￥${controller.totalPrice}',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              controller.submit();
            },
            child: Text('确认订单'),
          )
        ],
      ),
    );
  }
}
