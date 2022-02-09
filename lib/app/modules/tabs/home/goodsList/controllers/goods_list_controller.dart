import 'package:flutter_app/app/common/network/global.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../goods_item_model.dart';

class GoodsListController extends GetxController {
  // 分页
  int _pageNum = 1;
  // 后端定死，不用传
  int get pageSize => 10;
  // 数据加载完毕否
  bool noMoreData = false;
  // 分页controller
  late final RefreshController refreshController;

  final String type;
  final _goodsList = <dynamic>[].obs;
  List<dynamic> get goodsList => _goodsList;

  GoodsListController(this.type);

  set goodsList(List<dynamic> list) {
    _goodsList.addAll(list);
  }

  // 加载分页
  refreshData() {
    if (!noMoreData) {
      _pageNum++;
      load();
    }
  }

  String get url => 'index';

  load() async {
    final res = await HttpUtils.instance.get('$url/$type/$_pageNum');
    final list = res.data.map((item) => GoodsItemModel.fromJson(item)).toList();
    goodsList = list;
    refreshController.loadComplete();

    if (list.length < pageSize) {
      noMoreData = true;
      refreshController.loadNoData();
    }
  }

  @override
  void onInit() {
    refreshController = RefreshController();
    load();
    super.onInit();
  }

  @override
  void onClose() {
    // refreshController.dispose();
    super.onClose();
  }
}
