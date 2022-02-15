import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/keep_alive_tab_view.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/modules/tabs/home/views/my_tab_bar.dart';
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
          title: Text(
            '收藏',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: !controller.isEmpty
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
                  child: controller.isShowFilter ? MyTabBar<StarListController>() : Container(),
                )
              : PreferredSize(
                  child: Container(),
                  preferredSize: Size.fromHeight(0),
                ),
        ),
        body: TabBarView(
          physics:
              (controller.isEmpty || !controller.isShowFilter) ? NeverScrollableScrollPhysics() : PageScrollPhysics(),
          controller: controller.tabController,
          children: controller.tabs
              .map(
                (e) => KeepAliveTabView(
                  Container(
                    child: StarDetailListView(e.value!),
                    color: Colors.white,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
