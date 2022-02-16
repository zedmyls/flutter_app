import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class GetRefreshController extends GetxController {
  // 分页
  int pageNum = 1;
  // 后端定死，不用传
  int get pageSize => 10;
  // 数据加载完毕否
  bool noMoreData = false;

  /// 分页controller，这里默认不销毁
  late final RefreshController refreshController;

  // 加载分页
  refreshData() {
    if (!noMoreData) {
      pageNum++;
      load();
    }
  }

  // 初始化状态
  reset() {
    pageNum = 1;
    refreshController.refreshToIdle();
    noMoreData = false;
  }

  load();

  @override
  void onInit() {
    refreshController = RefreshController();
    load();
    super.onInit();
  }
}
