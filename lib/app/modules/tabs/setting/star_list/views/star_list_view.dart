import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/controllers/star_list_controller.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/views/star_detail_list_view.dart';
import 'package:get/get.dart';

class StarListView extends GetView<StarListController> {
  static final String path = "lib/src/pages/lists/list1.dart";

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: MyAppBar(
          context: context,
          title: '收藏',
          actions: <Widget>[
            IconButton(
              onPressed: controller.collection.isNotEmpty
                  ? () {
                      controller.toggleFilterVisible();
                    }
                  : null,
              icon: Icon(Icons.filter_list),
            ),
          ],
          bottom: controller.isShowFilter
              ? PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: controller.isShowFilter ? _buildFilter() : Container(),
                )
              : PreferredSize(
                  child: Container(),
                  preferredSize: Size.fromHeight(0),
                ),
        ),
        body: Container(
          child: StarDetailListView(),
          color: Get.isDarkMode ? Color(0xff303030) : Colors.white,
        ),
      ),
    );
  }

  Widget _buildFilter() {
    return Container(
      color: Get.isDarkMode ? Color(0xff303030) : Color(0xfff9f9f9),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: controller.tabs
            .map(
              (e) => GestureDetector(
                child: Text(
                  e.value!,
                  style: controller.active!.value == e.value
                      ? TextStyle(
                          color: Color(0xFFFE4A49),
                          fontWeight: FontWeight.w600,
                        )
                      : null,
                ),
                onTap: () {
                  controller.index = controller.indexList.indexWhere(
                    (element) => element.value == e.value,
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
