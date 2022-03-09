import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/common/views/my_buttons.dart';
import 'package:flutter_app/app/modules/tabs/category/category_goods_list/controllers/category_goods_list_controller.dart';
import 'package:flutter_app/app/modules/tabs/category/category_goods_list/views/category_goods_list_view.dart';
import 'package:flutter_app/app/modules/tabs/category/category_model.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '分类',
        context: context,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Container(
              width: Get.width * .3,
              child: ListView.builder(
                itemBuilder: (ctx, index) => _BuildItem(controller.categories[index], index),
                itemCount: controller.categories.length,
              ),
            ),
          ),
          Expanded(
            child: CategoryGoodsListView(),
          )
          // Column(
          //   children: [
          //     Container(
          //       height: 50,
          //       width: 300,
          //       child: Expanded(
          //         child: MyTabBar<CategoryController>(),
          //       ),
          //     ),
          //     CategoryGoodsListView(),
          //   ],
          // )
        ],
      ),
    );
  }
}

class _BuildItem extends GetView<CategoryController> {
  final CategoryModel category;
  final int index;
  const _BuildItem(this.category, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (_) {},
      initiallyExpanded: index == 0,
      title: Text(category.name!),
      children: category.children!
          .map(
            (e) => Obx(
              () => ListTile(
                title: Text(e.name!),
                onTap: () {
                  controller.selectedId = e.id_!;
                  Get.find<CategoryGoodsListController>().refreshList();
                },
                selected: controller.selectedId == e.id_,
                selectedColor: ButtonType.success.color,
              ),
            ),
          )
          .toList(),
    );
  }
}
