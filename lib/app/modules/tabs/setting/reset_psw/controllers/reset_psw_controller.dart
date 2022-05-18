import 'package:flutter_app/app/common/utils.dart';
import 'package:get/get.dart';
import '../../../../../common/network/global.dart';

class ResetPswController extends GetxController {
  final _psw = ''.obs;
  final _confirm_psw = ''.obs;

  String get psw => _psw.value;
  String get confirm_psw => _confirm_psw.value;

  set psw(String val) {
    _psw.value = val;
  }

  set confirm_psw(String val) {
    _confirm_psw.value = val;
  }

  submit() async {
    if (psw != confirm_psw) {
      showErrorMessage('两次密码输入不一致');
      return;
    }

    loadingToast(
      () => HttpUtils.instance.put('user/reset_psw', data: {'password': psw}),
      successCallback: (res) {
        Get.back();
        showSuccessMessage(res!.data['message']);
      },
    );
  }
}
