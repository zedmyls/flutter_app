import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_list_controller.dart';

class OrderListView extends GetView<OrderListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OrderListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
