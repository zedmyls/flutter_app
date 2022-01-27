import 'package:get/get.dart';

mixin GetIndexListMixin<T> {
  final _index = 0.obs;

  int get index => _index.value;

  List<T> get indexList;

  set index(int i) {
    if (index != i) _index.value = i;
  }

  T? get active => indexList.isNotEmpty ? indexList[index] : null;
}
