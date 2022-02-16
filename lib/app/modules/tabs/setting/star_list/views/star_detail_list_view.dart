import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/no_data.dart';
import 'package:flutter_app/app/common/views/refresh_view.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/controllers/star_list_controller.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/views/star_item_view.dart';
import 'package:get/get.dart';

class StarDetailListView extends GetView<StarListController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.collection.isNotEmpty
          ? RefreshView(
              child: ListView.builder(
                padding: EdgeInsets.all(6),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return StarItemView(controller.collection[index]);
                },
                itemCount: controller.collection.length,
              ),
              onLoading: () {
                controller.refreshData();
              },
              controller: controller.refreshController,
            )
          : NoData(),
    );
  }
}
