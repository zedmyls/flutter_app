import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/home/goods_item_model.dart';

class StarItemView extends StatelessWidget {
  final GoodsItemModel item;
  const StarItemView(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: <Widget>[
          Container(
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
          Padding(
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
                Text(
                  item.price.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
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
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('看相似'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('降价通知'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage('assets/images/icon/cart_button.png'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
