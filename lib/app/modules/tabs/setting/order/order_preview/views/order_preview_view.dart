import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/MoneyView.dart';
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
        context: context,
        title: '订单预览',
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Get.isDarkMode ? Color(0xff303030) : Colors.white,
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
                      onTap: () {
                        controller.selectAddr();
                      },
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
            color: Get.isDarkMode ? Color(0xff303030) : Colors.white,
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
            () => MoneyView(
              money: controller.totalPrice,
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.w600,
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
