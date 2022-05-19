import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/common/views/no_data.dart';

import 'package:get/get.dart';

import '../../views/goods_item.dart';
import '../controllers/home_search_controller.dart';

class HomeSearchView extends GetView<HomeSearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '${Get.arguments} 搜索结果',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Obx(
            () => controller.list.isNotEmpty
                ? Column(
                    children: [
                      Text('总数：${controller.list.length}'),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return GoodsItem(controller.list[index]);
                        },
                        itemCount: controller.list.length,
                      ),
                    ],
                  )
                : NoData(),
          ),
        ),
      ),
    );
  }
}
