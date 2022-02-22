import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/MoneyView.dart';
import 'package:flutter_app/app/common/views/keep_alive_tab_view.dart';
import 'package:flutter_app/app/common/views/no_data.dart';
import 'package:flutter_app/app/common/views/refresh_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/enum/order_status.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_goods_item_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_list/controllers/order_list_controller.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_list/controllers/order_tab_view_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../models/order_model.dart';

class OrderListView extends GetView<OrderListController> {
  OrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: TabBarView(
                  controller: controller.tabController,
                  children: controller.tabs
                      .map(
                        (e) => _BuildTabBarView(tag: e.value!),
                      )
                      .toList(),
                ),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff696b9e),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "订单列表",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TabBar(
                          controller: controller.tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.white,
                          unselectedLabelColor: const Color(0xffEC751C),
                          labelPadding: const EdgeInsets.all(0),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              colors: <Color>[
                                Color(0xffFDA149),
                                Color(0xffFF4352),
                              ],
                            ),
                          ),
                          tabs: controller.tabs
                              .map(
                                (e) => Tab(
                                  child: Text(e.key!),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildTabBarView extends StatelessWidget {
  final String tag;
  const _BuildTabBarView({Key? key, required this.tag}) : super(key: key);

  OrderTabViewController get _controller => Get.find(tag: tag);

  @override
  Widget build(BuildContext context) {
    Get.put(OrderTabViewController(tag), tag: tag);
    return KeepAliveTabView(
      Obx(
        () => _controller.orderList.isNotEmpty
            ? RefreshView(
                child: ListView.builder(
                  itemCount: _controller.orderList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _BuildItem(_controller.orderList[index]);
                  },
                ),
                onLoading: () {
                  _controller.refreshData();
                },
                controller: _controller.refreshController,
              )
            : NoData(
                img: 'assets/images/tabs/profile/no_order.png',
                tips: '暂无订单',
              ),
      ),
    );
  }
}

class _BuildItem extends StatelessWidget {
  final OrderWithoutAddrModel order;
  const _BuildItem(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '店铺名待补充',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  OrderStatus.values
                      .singleWhere(
                        (element) => element.status == order.status!,
                      )
                      .value,
                  style: TextStyle(
                    color: Color(0xffff5000),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            order.orderDetail!.goodsList!.length <= 3
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return OrderGoodsItemView(
                        order.orderDetail!.goodsList![index],
                        height: 50,
                      );
                    },
                    itemCount: order.orderDetail!.goodsList!.length,
                  )
                : Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return OrderGoodsItemView(
                            order.orderDetail!.goodsList![index],
                            height: 50,
                          );
                        },
                        itemCount: 3,
                      ),
                      Text(
                        '点击查看该订单全部${order.orderDetail!.goodsList!.length}个商品',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MoneyView(
                  money: order.totalPrice!,
                  color: Colors.grey,
                  fontSize: 14,
                  prefix: '总价：',
                ),
                SizedBox(width: 5),
                MoneyView(
                  money: order.totalPrice!,
                  color: Colors.red,
                  fontSize: 16,
                  prefix: '实付款：',
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Get.toNamed(Routes.ORDER_DETAIL, arguments: order.id);
      },
    );
  }
}
