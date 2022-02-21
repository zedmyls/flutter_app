import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/mixins/get_index_list_mixin.dart';
import 'package:flutter_app/app/common/models/option_model.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/enum/order_status.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController with GetTickerProviderStateMixin, GetIndexListMixin {
  late final TabController tabController;
  final List<OptionModel> tabs = [];

  @override
  void onInit() {
    tabs.add(OptionModel(key: '全部', value: '0'));
    for (var element in OrderStatus.values.sublist(0, 4)) {
      tabs.add(
        OptionModel(
          key: element.value,
          value: element.status.toString(),
        ),
      );
    }

    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  List<OptionModel> get indexList => tabs;
}
