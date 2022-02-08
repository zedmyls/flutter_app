import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItemView extends StatelessWidget {
  final CartItemModel item;

  CartItemView(this.item);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: false, // 上下滚动时，不关闭
      startActionPane: ActionPane(
        extentRatio: .1,
        motion: const ScrollMotion(),
        children: [
          SizedBox(width: 10),
          InkWell(
            child: Image.asset(
              'assets/images/unchecked.png',
              fit: BoxFit.fitWidth,
              width: 25,
            ),
            onTap: () {},
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: .2,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '移除',
          ),
        ],
      ),
      child: _buildCartItem(),
    );
  }

  Widget _buildCartItem() {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: EdgeInsets.all(10),
      height: 130,
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(item.goodsId!.coverUrl!),
              fit: BoxFit.cover,
            )),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          item.goodsId!.title!,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Price: "),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '￥${item.goodsId!.price}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Sub Total: "),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '￥${item.goodsId!.price! * item.num!}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.orange,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Ships Free",
                        style: TextStyle(color: Colors.orange),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.redAccent.shade200,
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${item.num!}'),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.lightBlue,
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
