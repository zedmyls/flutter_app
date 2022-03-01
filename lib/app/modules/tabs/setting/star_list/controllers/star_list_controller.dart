import 'package:flutter_app/app/common/controllers/get_refresh_controller.dart';
import 'package:flutter_app/app/common/mixins/get_index_list_mixin.dart';
import 'package:flutter_app/app/common/models/option_model.dart';
import 'package:get/get.dart';

import '../../../../../common/network/global.dart';
import '../../../../../common/utils.dart';
import '../../../home/enum/goods_type.dart';
import '../../../home/goods_item_model.dart';
import '../../../shopcart/controllers/shopcart_controller.dart';

class StarListController extends GetRefreshController with GetIndexListMixin<OptionModel> {
  final _isShowFilter = false.obs;
  final _collection = <dynamic>[].obs;

  final tabs = [
    OptionModel(key: '默认排序', value: 'default'),
    OptionModel(key: '热销', value: GoodsType.sale.value),
    OptionModel(key: '推荐', value: GoodsType.recommend.value),
    OptionModel(key: '最新', value: GoodsType.newGoods.value),
  ];

  List<dynamic> get collection => _collection;
  bool get isShowFilter => _isShowFilter.value;
  String get url => 'collect';

  set collection(List<dynamic> list) {
    _collection.addAll(list);
  }

  toggleFilterVisible() {
    _isShowFilter.value = !_isShowFilter.value;
  }

  // 收藏，取消收藏
  toggleCollectStatus(String id_) {
    loadingToast(
      () => HttpUtils.instance.post(url, data: {'goods_id': id_}),
      successCallback: (res) {
        showSuccessMessage(res!.data['message']);
        refreshList();
      },
    );
  }

  // 降价通知，纯前端操作
  priceReduce() {
    showSuccessMessage('该商品降价时，您将收到通知');
  }

  // 添加到购物车
  addToCart(String id_) {
    loadingToast(
        () => HttpUtils.instance.post(
              'carts',
              data: {
                'num': 1,
                '_id': id_,
              },
            ), successCallback: (res) {
      // 后端是我之前写的，烂！
      if (res!.statusCode == 201) {
        showSuccessMessage(res.data['message']);
        Get.find<ShopcartController>().load();
      }
    });
  }

  // 刷新
  refreshList() {
    reset();
    collection.clear();
    load();
  }

  @override
  load() async {
    final res = await HttpUtils.instance.get('$url/true/$pageNum/${active!.value}');
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
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  @override
  List<OptionModel> get indexList => tabs;

  @override
  set index(int i) {
    reset();
    collection.clear();
    super.index = i;
    load();
  }
}
