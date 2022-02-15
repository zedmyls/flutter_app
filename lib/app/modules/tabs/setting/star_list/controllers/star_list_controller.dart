import 'package:flutter_app/app/common/models/option_model.dart';
import 'package:flutter_app/app/modules/tabs/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class StarListController extends HomeController {
  final _isEmpty = true.obs;
  final _isShowFilter = false.obs;

  bool get isEmpty => _isEmpty.value;
  bool get isShowFilter => _isShowFilter.value;

  set isEmpty(bool flag) {
    _isEmpty.value = flag;
  }

  toggleFilterVisible() {
    _isShowFilter.value = !_isShowFilter.value;
  }

  @override
  void onInit() {
    // all 可以换成任意值，只要不是枚举中的值就可以
    tabs.insert(0, OptionModel(key: '默认排序', value: 'default'));
    super.onInit();
  }
}
