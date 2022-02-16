import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/views/addr_item_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_preview/controllers/order_preview_controller.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
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
                  return _checkOutItem(controller.cartList[index]);
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
            onPressed: () {},
            child: Text('确认订单'),
          )
        ],
      ),
    );
  }

  Widget _checkOutItem(CartItemModel item) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            child: Image.network(
              item.goodsId!.coverUrl!,
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
                  Text(item.goodsId!.title!, maxLines: 2),
                  // Text("白色,175", maxLines: 1),
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "￥${item.goodsId!.price!}",
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
