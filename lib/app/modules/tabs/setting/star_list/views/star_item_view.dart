import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/MoneyView.dart';
import 'package:flutter_app/app/common/views/my_buttons.dart';
import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';
import 'package:flutter_app/app/modules/tabs/setting/star_list/controllers/star_list_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class StarItemView extends StatelessWidget {
  final GoodsItemModel item;
  const StarItemView(this.item, {Key? key}) : super(key: key);

  StarListController get _controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: false, // 上下滚动时，不关闭
      endActionPane: ActionPane(
        extentRatio: .2,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Get.find<StarListController>().toggleCollectStatus(item.id_!);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '移除',
          ),
        ],
      ),
      child: _buildStarItem(),
    );
  }

  Widget _buildStarItem() {
    return Card(
      elevation: 3,
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              height: 125,
              width: 110,
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.coverUrl!),
                  fit: BoxFit.cover,
                ),
              ),
              // todo 折扣
              // child: item.discount == null
              //     ? Container()
              //     : Container(
              //         color: Colors.deepOrange,
              //         child: Column(
              //           mainAxisSize: MainAxisSize.min,
              //           children: <Widget>[
              //             Text(
              //               item.discount!,
              //               style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
              //             ),
              //             Text(
              //               "Discount",
              //               style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
              //             ),
              //           ],
              //         ),
              //       ),
            ),
            onTap: () {
              Get.toNamed(
                Routes.GOODS_DETAIL,
                arguments: item.id,
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.title!,
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  // todo 标签
                  // Text(
                  //   item.place!,
                  //   style: TextStyle(fontSize: 14, color: Colors.black87),
                  // ),
                  MoneyView(money: item.price!),
                  SizedBox(
                    height: 10,
                  ),
                  // todo 评分
                  // Row(
                  //   children: <Widget>[
                  //     Icon(
                  //       Icons.star,
                  //       color: Colors.pink,
                  //       size: 18,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       color: Colors.pink,
                  //       size: 18,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       color: Colors.pink,
                  //       size: 18,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       color: Colors.pink,
                  //       size: 18,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       color: Colors.pink,
                  //       size: 18,
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      GradientButton(
                        title: '看相似',
                        type: ButtonType.info,
                        onPressed: () {},
                      ),
                      SizedBox(width: 3),
                      GradientButton(
                        title: '降价通知',
                        type: ButtonType.warning,
                        onPressed: () {
                          _controller.priceReduce();
                        },
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     _controller.addToCart(item.id_!);
                      //   },
                      //   icon: Image(
                      //     image: AssetImage('assets/images/icon/cart_button.png'),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
