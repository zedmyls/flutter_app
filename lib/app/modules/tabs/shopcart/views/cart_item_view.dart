import 'package:flutter/material.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/cart_item_model.dart';
import 'package:flutter_app/app/modules/tabs/shopcart/controllers/shopcart_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CartItemView extends StatelessWidget {
  final CartItemModel item;

  CartItemView(this.item);

  ShopcartController get _controller => Get.find();

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
              item.isChecked! ? 'assets/images/icon/checked.png' : 'assets/images/icon/unchecked.png',
              fit: BoxFit.fitWidth,
              width: 25,
            ),
            onTap: () {
              _controller.toggleCheckStatus(item.goodsId!.id_!, !item.isChecked!);
            },
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: .2,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              _controller.deleteCartItem(item.goodsId!.id_!);
            },
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
    return GestureDetector(
      child: Container(
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
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
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
                        ),
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
                            Visibility(
                              child: InkWell(
                                onTap: () {
                                  _controller.changeGoodsNum(item.goodsId!.id_!, item.num! - 1);
                                },
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
                              visible: item.num! > 1,
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
                            Visibility(
                              child: InkWell(
                                onTap: () {
                                  _controller.changeGoodsNum(item.goodsId!.id_!, item.num! + 1);
                                },
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
                              visible: item.num! < 99,
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
      ),
      onTap: () {
        Get.toNamed(Routes.GOODS_DETAIL, arguments: item.goodsId!.id);
      },
    );
  }
}
