import 'package:flutter/cupertino.dart';
import 'package:flutter_app/app/common/mixins/get_params_mixin.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:get/get.dart';

import '../user_update_request_model.dart';

class UpdateInfoController extends GetxController with GetParamsMixin<UserUpdateRequestModel> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String get url => 'user/info';

  submit() {
    if (!formKey.currentState!.validate()) return;
    loadingToast(
      () => HttpUtils.instance.put(
        url,
        data: params.toJson(),
      ),
      successCallback: (res) {
        loadingToast(() => Get.find<UserController>().load(), successCallback: (_) {
          Get.back();
          showSuccessMessage(res!.data['message']);
        });
      },
    );
  }

  @override
  void onInit() {
    obsParams.update((val) {
      val!.nickname = Get.find<UserController>().user.nickname!;
      val.personalDesc = Get.find<UserController>().user.personalDesc ?? '';
      val.avatar = Get.find<UserController>().avatar;
    });
    super.onInit();
  }

  @override
  UserUpdateRequestModel initParams() => UserUpdateRequestModel();
}
