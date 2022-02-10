import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/address_list_controller.dart';

class AddressListView extends GetView<AddressListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'AddressListView',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return _buildAddrItem();
        },
        itemCount: 3,
      ),
    );
  }

  Widget _buildAddrItem() {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '天津市河北区天津市',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '翻斗小区一号楼',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text('username'),
            SizedBox(width: 20),
            Text('12345678901'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit_location_outlined),
        ),
      ),
    );
  }
}
