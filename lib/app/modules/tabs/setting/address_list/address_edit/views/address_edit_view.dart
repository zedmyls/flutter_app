import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/my_input.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:get/get.dart';

import '../controllers/address_edit_controller.dart';

class AddressEditView extends GetView<AddressEditController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: MyAppBar(
        title: Text(
          controller.isUpdate ? '编辑地址' : '添加地址',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyInput(
              label: '姓名',
              placeHolder: '收货人姓名',
              line: false,
              onChanged: (value) {
                controller.obsParams.update((val) {
                  val!.name = value;
                });
              },
            ),
            MyInput(
              label: '手机号',
              placeHolder: '收货人手机号',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                controller.obsParams.update((val) {
                  val!.tel = value;
                });
              },
            ),
            MyInput(
              label: '地址',
              otherWidget: GestureDetector(
                child: Obx(
                  () => Text(
                    controller.params.address ?? '省市县，点击选择',
                    style: TextStyle(
                      color: controller.params.address != null ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                onTap: () async {
                  final addr = await CityPickers.showCityPicker(
                      context: context, locationCode: controller.params.areaCode ?? '110000');

                  if (addr != null) {
                    controller.obsParams.update((val) {
                      val!.areaCode = addr.areaId;
                      val.address = '${addr.provinceName}${addr.cityName}${addr.areaName}';
                    });
                  }
                },
              ),
            ),
            MyInput(
              label: '详细地址',
              placeHolder: '街道门牌、楼层房间号等信息',
              onChanged: (value) {
                controller.obsParams.update((val) {
                  val!.addressDetail = value;
                });
              },
            ),
            MyInput(
              label: '设为默认收货地址',
              otherWidget: Obx(
                () => Switch(
                  value: controller.params.isDefault ?? false,
                  onChanged: (flag) {
                    controller.obsParams.update((val) {
                      val!.isDefault = flag;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.submit();
              },
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
