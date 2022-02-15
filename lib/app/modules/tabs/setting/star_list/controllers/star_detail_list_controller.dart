import 'package:flutter_app/app/common/controllers/get_refresh_controller.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/controllers/star_list_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StarDetailListController extends GetRefreshController {
  final String type;
  final _collection = <dynamic>[].obs;
  List<dynamic> get collection => _collection;

  StarDetailListController(this.type);

  set collection(List<dynamic> list) {
    _collection.addAll(list);
  }

  String get url => 'collect';

  @override
  load() async {
    final res = await HttpUtils.instance.get('$url/true/$pageNum/$type');
    print(res);
    final list = res.data['collections'].map((item) => GoodsItemModel.fromJson(item)).toList();
    collection = list;

    // 这里封装的不是很好，不应该暴露出来
    refreshController.loadComplete();
    if (list.length < pageSize) {
      noMoreData = true;
      refreshController.loadNoData();
    }
  }

  @override
  void onInit() async {
    refreshController = RefreshController();
    await load();
    Get.find<StarListController>().isEmpty = collection.isEmpty;
    super.onInit();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}
