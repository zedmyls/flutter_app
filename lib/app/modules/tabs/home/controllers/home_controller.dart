import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/models/option_model.dart';
import 'package:flutter_app/app/modules/tabs/home/enum/goods_type.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  final tabs = [
    OptionModel(key: '热销', value: GoodsType.sale.value),
    OptionModel(key: '推荐', value: GoodsType.recommend.value),
    OptionModel(key: '最新', value: GoodsType.newGoods.value),
  ];
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
