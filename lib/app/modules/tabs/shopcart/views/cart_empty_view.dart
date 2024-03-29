import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_buttons.dart';
import 'package:flutter_app/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:get/get.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/images/tabs/cart/cart_empty.png'),
        ),
        Text(
          '购物车空空如也~~',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 100,
          child: GradientButton(
            type: ButtonType.info,
            onPressed: () {
              Get.find<TabsController>().goHome();
            },
            title: '去逛逛',
          ),
        ),
      ],
    );
  }
}
