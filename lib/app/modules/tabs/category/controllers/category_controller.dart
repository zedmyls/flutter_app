import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/modules/tabs/category/category_model.dart';
import 'package:flutter_app/app/modules/tabs/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../category_goods_list/controllers/category_goods_list_controller.dart';

class CategoryController extends HomeController {
  final _categories = [].obs;
  final _selectedId = ''.obs;

  String get url => 'category';
  String get selectedId => _selectedId.value;
  List get categories => _categories;

  set selectedId(String id) {
    _selectedId.value = id;
  }

  load() async {
    final res = await HttpUtils.instance.get(url);
    _categories.value = res.data['categories']
        .map((item) => CategoryModel.fromJson(item))
        .where((item) => item.children.length != 0)
        .toList();

    selectedId = _categories[0].children[0].id_;
  }

  @override
  void onInit() async {
    await load();
    Get.find<CategoryGoodsListController>().load();
    super.onInit();
  }
}
