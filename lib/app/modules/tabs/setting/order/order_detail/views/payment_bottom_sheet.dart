import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_detail/controllers/order_detail_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PaymentBottomSheet extends GetView<OrderDetailController> {
  final VoidCallback onSubmit;
  const PaymentBottomSheet(this.onSubmit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  InkWell(
                    child: Icon(Icons.close),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '￥',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Obx(
                      () => Text(
                        '${controller.order.totalPrice}.00',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('支付手机号'),
                  Obx(
                    () => Text(Get.find<UserController>().user.phone ?? ''),
                  ),
                ],
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  EasyLoading.showToast('敬请期待 ^.^');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/tabs/profile/bank_card.png'),
                          width: 25,
                        ),
                        SizedBox(width: 6),
                        Text('测试银行卡(1234)'),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '注：本APP仅为测试所用，一切数据都是伪造的。为保护您的个人信息，请不要在本APP输入任何真实信息。',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: ElevatedButton(
              onPressed: onSubmit,
              child: Text('确认付款'),
            ),
          ),
        ],
      ),
    );
  }
}
