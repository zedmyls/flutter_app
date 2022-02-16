import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/common/views/no_data.dart';
import 'package:flutter_app/app/common/views/tag_view.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../addr_model.dart';
import '../controllers/address_list_controller.dart';

class AddressListView extends GetView<AddressListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          '地址管理',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => controller.list.isNotEmpty
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return _buildAddrItem(controller.list[index], context);
                },
                itemCount: controller.list.length,
              )
            : NoData(),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 44,
          child: ElevatedButton(
            child: Text('新增地址'),
            onPressed: () {
              Get.toNamed(Routes.ADDRESS_EDIT);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAddrItem(AddrModel item, BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              confirmDialog(
                title: '⚠ 警告',
                msg: '确定要删除该地址吗？',
                onConfirm: () {
                  controller.deleteAddr(item.id!);
                },
              );
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '删除',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: controller.isSelectMode
            ? () {
                Get.back(result: item);
              }
            : null,
        child: Container(
          alignment: Alignment.center,
          height: 80,
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    item.isDefault!
                        ? Container(
                            child: TagView(txt: '默认'),
                            margin: EdgeInsets.only(right: 5),
                          )
                        : Container(),
                    Text(
                      item.address!.replaceFirst(item.addressDetail!, ''),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  item.addressDetail!,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(right: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.name!),
                  Text(item.tel!),
                ],
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                Get.toNamed(Routes.ADDRESS_EDIT, arguments: item.id!);
              },
              icon: Image(
                image: AssetImage('assets/images/icon/edit.png'),
                fit: BoxFit.fitWidth,
                width: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
