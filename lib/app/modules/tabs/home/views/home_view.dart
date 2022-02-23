import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/keep_alive_tab_view.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/modules/tabs/home/goodsList/views/goods_list_view.dart';
import 'package:flutter_app/app/modules/tabs/home/views/home_drawer.dart';
import 'package:flutter_app/app/modules/tabs/home/views/home_swiper.dart';
import 'package:flutter_app/app/modules/tabs/home/views/my_tab_bar.dart';
import 'package:flutter_app/app/modules/tabs/home/views/search_bar_ui.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: '主页',
      ),
      drawer: HomeDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: HomeSwiper(),
            ),
            SliverToBoxAdapter(
              child: SearchBarUI(),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: MyTabBar<HomeController>(),
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
                    color: context.isDarkMode ? Color(0xff303030) : Colors.white,
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
