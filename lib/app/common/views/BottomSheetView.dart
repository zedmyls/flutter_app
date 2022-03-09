import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetItem {
  String title;
  VoidCallback? onTap;

  BottomSheetItem({required this.title, this.onTap});
}

class BottomSheetView extends StatelessWidget {
  final List<BottomSheetItem> list;
  const BottomSheetView(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .3,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildItem(list[index]);
            },
            itemCount: list.length,
          ),
          _buildItem(
            BottomSheetItem(
              title: '取消',
              onTap: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BottomSheetItem item) {
    return ListTile(
      title: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      onTap: () {
        if (item.onTap != null) item.onTap!();
        Get.back();
      },
    );
  }
}
