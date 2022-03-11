import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => GestureDetector(
            child: Text(
              '跳过 ${controller.countDown}s',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              controller.goHome();
            },
          ),
        ),
      ),
    );
  }
}
