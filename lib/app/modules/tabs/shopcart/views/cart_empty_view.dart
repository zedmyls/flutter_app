import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/controllers/tabs_controller.dart';
import 'package:get/get.dart';

class CartEmptyView extends StatelessWidget {
  const CartEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/images/cart_empty.png'),
        ),
        Text(
          '购物车空空如也~~',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
            Get.find<TabsController>().goHome();
          },
          child: Text('去逛逛'),
        ),
      ],
    );
  }
}
