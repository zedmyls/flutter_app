import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/common/views/MoneyView.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/modules/goods_detail/controllers/goods_detail_controller.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class GoodsDetailView extends StatelessWidget {
  GoodsDetailController get controller => Get.find(tag: Get.arguments.toString());

  @override
  Widget build(BuildContext context) {
    Get.put(GoodsDetailController(), tag: Get.arguments.toString());
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Obx(
                  () => Icon(
                    controller.isCollected ? Icons.favorite : Icons.favorite_border,
                    color: controller.isCollected ? Theme.of(context).colorScheme.secondary : Colors.grey,
                  ),
                ),
                onPressed: () {
                  controller.toggleCollectStatus();
                },
              ),
              Obx(
                () => Text(
                  controller.detail.collected != null ? formatStarCount(controller.detail.collected!) : '',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          )
        ],
        title: '商品详情',
      ),
      body: _buildPageContent(),
    );
  }

  Widget _buildPageContent() {
    return SafeArea(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Obx(
                    () => Container(
                      height: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(controller.detail.coverUrl ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Obx(
                        () => controller.detail.price != null
                            ? MoneyView(
                                money: controller.detail.price!,
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              )
                            : Container(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Obx(
                    () => Text(
                      controller.detail.title ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "未添加的商品描述未添加的商品描述未添加的商品描述未添加的商品描述未添加的商品描述未添加的商品描述未添加的商品描述未添加的商品描述",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('sales：'),
                          Obx(
                            () => Text(controller.detail.sales.toString()),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('上架日期：'),
                          Obx(
                            () => Text(controller.detail.comeOutTime.toString()),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('推荐商品'),
                  _buildImagesGrid()
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildAddToCartButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImagesGrid() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10.0),
      height: 200,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) => GestureDetector(
            child: Row(
              children: [
                Column(
                  children: [
                    Image.network(
                      controller.likeGoods[index].coverUrl,
                      width: 100,
                    ),
                    SizedBox(height: 10),
                    Text(controller.likeGoods[index].title),
                  ],
                ),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            onTap: () {
              Get.toNamed(
                '${Routes.GOODS_DETAIL}/${controller.likeGoods[index].id}',
                arguments: controller.likeGoods[index].id,
              );
            },
          ),
          itemCount: controller.likeGoods.length,
        ),
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
              onPressed: () {
                controller.addToCart();
              },
              child: Text("加入购物车"),
              color: Colors.orange,
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
