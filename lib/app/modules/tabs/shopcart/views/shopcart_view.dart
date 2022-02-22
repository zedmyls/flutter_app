import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/common/views/need_login_view.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/views/cart_empty_view.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/views/cart_item_view.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../common/views/MoneyView.dart';

class ShopcartView extends GetView<ShopcartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        titleWidget: Obx(
          () => Text(
            '购物车 (${controller.totalCount})',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      body: Obx(
        () => !Get.find<UserController>().isLogin
            ? NeedLoginView()
            : controller.cartList.isEmpty
                ? CartEmptyView()
                : Column(
                    children: <Widget>[
                      Flexible(
                        child: ListView.builder(
                          itemCount: controller.cartList.length,
                          itemBuilder: (context, int index) {
                            return CartItemView(controller.cartList[index]);
                          },
                        ),
                      ),
                      _checkoutSection(),
                    ],
                  ),
      ),
    );
  }

  Widget _checkoutSection() {
    return Material(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "结算总计:",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                MoneyView(
                  money: controller.totalPrice,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                InkWell(
                  child: Image.asset(
                    controller.isCheckedAll ? 'assets/images/icon/checked.png' : 'assets/images/icon/unchecked.png',
                    fit: BoxFit.fitWidth,
                    width: 25,
                  ),
                  onTap: () {
                    controller.checkAll();
                  },
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Material(
                    color: Colors.red,
                    elevation: 1.0,
                    child: InkWell(
                      splashColor: Colors.redAccent,
                      onTap: controller.goodsIds.isNotEmpty
                          ? () {
                              Get.toNamed(Routes.ORDER_PREVIEW);
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "结算",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
