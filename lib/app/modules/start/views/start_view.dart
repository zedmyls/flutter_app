import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () => controller.goHome(),
          child: Obx(
            () => Text(
              '跳过 ${controller.countDown}s',
              style: TextStyle(fontSize: 20),
            ),
          ),
          // onTap: () {
          //
          // },
        ),
      ),
    );
  }
}
