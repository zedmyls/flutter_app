import 'package:flutter/material.dart';

import '../../../../../common/views/tag_view.dart';
import '../addr_model.dart';

class AddrItemView extends StatelessWidget {
  final AddrModel item;
  final VoidCallback? onTap;
  const AddrItemView(
    this.item, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
