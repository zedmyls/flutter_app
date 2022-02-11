import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/my_input.dart';
import 'package:get/get.dart';

import '../controllers/address_edit_controller.dart';

class AddressEditView extends GetView<AddressEditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddressEditView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          MyInput(
            label: '姓名',
            placeHolder: '收货人姓名',
          ),
          MyInput(label: '收货人手机号'),
          MyInput(
            label: '地址',
            placeHolder: '选择省 / 市 / 区',
          ),
          MyInput(
            label: '详细地址',
            placeHolder: '街道门牌、楼层房间号等信息',
          ),
          MyInput(label: '设为默认收货地址'),
        ],
      ),
    );
  }
}
