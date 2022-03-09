import 'package:flutter_app/app/common/controllers/get_refresh_controller.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/modules/tabs/category/controllers/category_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../home/goods_item_model.dart';

class CategoryGoodsListController extends GetRefreshController {
  final _goodsList = <dynamic>[].obs;
  List<dynamic> get goodsList => _goodsList;

  set goodsList(List<dynamic> list) {
    _goodsList.addAll(list);
  }

  String get url => 'category';

  @override
  load() async {
    final res = await HttpUtils.instance.get('$url/sale/${Get.find<CategoryController>().selectedId}/$pageNum');
    final list = res.data['goods'].map((item) => GoodsItemModel.fromJson(item)).toList();
    goodsList = list;

    // 这里封装的不是很好，不应该暴露出来
    refreshController.loadComplete();
    if (list.length < pageSize) {
      noMoreData = true;
      refreshController.loadNoData();
    }
  }

  refreshList() {
    reset();
    goodsList.clear();
    load();
  }

  @override
  void onInit() {
    refreshController = RefreshController();
  }
}
