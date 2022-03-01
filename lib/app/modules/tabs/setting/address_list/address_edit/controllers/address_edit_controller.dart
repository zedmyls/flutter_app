import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/common/mixins/get_params_mixin.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/controllers/address_list_controller.dart';
import 'package:get/get.dart';

import '../../addr_model.dart';

class AddressEditController extends GetxController with GetParamsMixin<AddrModel> {
  // 路由参数
  late final int? _id;
  // 更新地址时才会用到
  final _data = AddrModel().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String get url => 'addr';
  AddrModel get data => _data.value;
  bool get isUpdate => _id != null;

  // 添加或更新地址
  submit() {
    if (!formKey.currentState!.validate()) return;
    if (params.address.isEmpty) {
      showErrorMessage('请选择地址');
      return;
    }

    loadingToast(
      () => isUpdate
          ? HttpUtils.instance.put(
              url,
              data: params.toJson(),
            )
          : HttpUtils.instance.post(
              url,
              data: params.toJson(),
            ),
      successCallback: (res) {
        Get.back();
        showSuccessMessage(res!.data['message']);
        Get.find<AddressListController>().load();
      },
    );
  }

  // 根据id回显地址
  load() {
    loadingToast(() => HttpUtils.instance.get('$url/$_id'), successCallback: (res) {
      params = AddrModel.fromJson(res!.data['addr']);
    });
  }

  @override
  void onInit() {
    _id = Get.arguments;
    if (_id != null) load();
    super.onInit();
  }

  @override
  AddrModel initParams() => AddrModel();
}
