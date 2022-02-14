import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/keep_alive_tab_view.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/modules/tabs/home/goodsList/views/goods_list_view.dart';
import 'package:flutter_app/app/modules/tabs/home/views/home_drawer.dart';
import 'package:flutter_app/app/modules/tabs/home/views/search_bar_ui.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          '主页',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: HomeDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: SearchBarUI(),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: Container(
                  width: Get.width,
                  height: 50,
                  color: const Color(0xfff9f9f9),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TabBar(
                    controller: controller.tabController,
                    tabs: controller.tabs
                        .map(
                          (e) => Tab(
                            child: Text(
                              e.value!,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: controller.tabController,
          children: controller.tabs
              .map(
                (e) => KeepAliveTabView(
                  Container(
                    child: GoodsListView(e.value!),
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

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: child,
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
