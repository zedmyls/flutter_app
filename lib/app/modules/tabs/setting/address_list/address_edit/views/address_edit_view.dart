import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/my_input.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:get/get.dart';

import '../controllers/address_edit_controller.dart';

class AddressEditView extends GetView<AddressEditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Obx(
          () => Text(
            controller.isUpdate.value ? '编辑地址' : '添加地址',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
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
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('保存'),
          ),
        ],
      ),
    );
  }
}
