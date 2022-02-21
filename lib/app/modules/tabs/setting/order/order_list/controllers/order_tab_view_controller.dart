import 'package:flutter_app/app/common/controllers/get_refresh_controller.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/models/order_model.dart';
import 'package:get/get.dart';

class OrderTabViewController extends GetRefreshController {
  final String _status;
  final _orderList = [].obs;

  OrderTabViewController(this._status);

  List get orderList => _orderList;

  @override
  int get pageSize => 5;

  @override
  load() async {
    final res = await HttpUtils.instance.get('orders/$pageNum/$_status');
    _orderList.addAll(
      res.data['orderList']
          .map(
            (item) => OrderWithoutAddrModel.fromJson(item),
          )
          .toList(),
    );

    // 这里封装的不是很好，不应该暴露出来
    refreshController.loadComplete();
    if (res.data['orderList'].length < pageSize) {
      noMoreData = true;
      refreshController.loadNoData();
    }
  }

  refreshList() {
    reset();
    orderList.clear();
    load();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}
