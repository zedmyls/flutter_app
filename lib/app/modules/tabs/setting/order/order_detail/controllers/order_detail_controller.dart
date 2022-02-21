import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/network/global.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/modules/tabs/setting/address_list/addr_model.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/enum/order_status.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/models/order_model.dart';
import 'package:flutter_app/app/modules/tabs/setting/order/order_detail/views/payment_bottom_sheet.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  final _order = OrderModel().obs;
  final _addr = AddrModel().obs;
  final _status = 0.obs;
  final checked = false.obs;

  OrderModel get order => _order.value;
  String get url => 'orders';
  AddrModel get addr => _addr.value;
  int get status => _status.value;

  load() {
    loadingToast(() => HttpUtils.instance.get('$url/${Get.arguments}'), successCallback: (res) {
      _order.value = OrderModel.fromJson(res.data['order']);
      _addr.value = _order.value.addressId!;
      _status.value = _order.value.status ?? 0;
    });
  }

  // 提醒发货
  remindDelivery() {
    showSuccessMessage("商家已收到，将会尽快为您发货");
  }

  // 修改地址
  selectAddr() async {
    AddrModel res = await Get.toNamed(Routes.ADDRESS_LIST, arguments: 'select');
    loadingToast(
      () => HttpUtils.instance.put(
        url,
        data: {
          'order_id': order.id,
          'address_id': res.id,
        },
      ),
      successCallback: (_) {
        _addr.value = res;
        showSuccessMessage(_.data['message']);
      },
    );
  }

  // 删除订单
  deleteOrder() {
    confirmDialog(
      title: '删除',
      msg: '您确定要删除该订单吗？',
      onConfirm: () {
        loadingToast(
          () => HttpUtils.instance.delete(
            '$url/${order.id}/${checked.value ? 1 : 0}',
          ),
          successCallback: (res) {
            Get.back();
            showSuccessMessage(res.data['message']);
            if (checked.value) Get.find<ShopcartController>().load();
          },
        );
      },
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Checkbox(
              value: checked.value,
              onChanged: (flag) {
                checked.value = flag!;
              },
            ),
          ),
          Text(
            '包含的商品放回购物车',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // 付款
  pay() {
    Get.bottomSheet(PaymentBottomSheet(_pay));
  }

  _pay() {
    loadingToast(
      () => HttpUtils.instance.patch(
        url,
        data: {'order_id': order.id},
      ),
      successCallback: (res) {
        EasyLoading.showSuccess(res.data['message']);
        _status.value = OrderStatus.waitingSend.status;
        Get.back();
      },
    );
  }

  @override
  void onInit() {
    load();
    super.onInit();
  }
}
