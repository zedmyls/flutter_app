import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => controller.indexList[index],
        itemCount: controller.indexList.length,
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          controller.index = index;
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xffBDBEC8),
          selectedItemColor: Colors.lightBlue,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          currentIndex: controller.index,
          items: controller.tabs,
          onTap: (index) {
            controller.index = index;
          },
        ),
      ),
    );
  }
}
