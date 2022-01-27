import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shopcart_controller.dart';

class ShopcartView extends GetView<ShopcartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopcartView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ShopcartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
