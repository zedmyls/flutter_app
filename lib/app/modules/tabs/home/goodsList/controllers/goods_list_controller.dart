import 'package:flutter_app/app/common/controllers/get_refresh_controller.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:get/get.dart';

import '../../goods_item_model.dart';

class GoodsListController extends GetRefreshController {
  final String type;
  final _goodsList = <dynamic>[].obs;
  List<dynamic> get goodsList => _goodsList;

  GoodsListController(this.type);

  set goodsList(List<dynamic> list) {
    _goodsList.addAll(list);
  }

  String get url => 'index';

  @override
  load() async {
    final res = await HttpUtils.instance.get('$url/$type/$pageNum');
    final list = res.data.map((item) => GoodsItemModel.fromJson(item)).toList();
    goodsList = list;

    // 这里封装的不是很好，不应该暴露出来
    refreshController.loadComplete();
    if (list.length < pageSize) {
      noMoreData = true;
      refreshController.loadNoData();
    }
  }
}
