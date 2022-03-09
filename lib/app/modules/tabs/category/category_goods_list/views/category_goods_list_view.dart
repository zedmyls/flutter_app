import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/refresh_view.dart';
import 'package:flutter_app/app/modules/tabs/home/views/goods_item.dart';
import 'package:get/get.dart';

import '../controllers/category_goods_list_controller.dart';

class CategoryGoodsListView extends GetView<CategoryGoodsListController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshView(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return GoodsItem(controller.goodsList[index]);
          },
          itemCount: controller.goodsList.length,
        ),
        onLoading: () {
          controller.refreshData();
        },
        controller: controller.refreshController,
      ),
    );
  }
}
