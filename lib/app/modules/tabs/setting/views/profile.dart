import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  UserController get _controller => Get.find();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 1.8;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          buildTop(context, height, width),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildOption(Icons.account_circle_rounded, '账号管理', false),
                      buildOption(Icons.location_city_outlined, '地址管理', false),
                      buildOption(Icons.settings, '通用设置', false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildOption(Icons.card_giftcard, '关于我们', false),
                      buildOption(Icons.pie_chart, 'Daily bonus', false),
                      buildOption(Icons.remove_red_eye, 'Visitors', false),
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

  Widget buildTop(context, double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: height * 0.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Familiar',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(_controller.user.avatar ??
                                'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_bt%2F0%2F13699153794%2F1000.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1645933980&t=90749073f3723aa26911bf38814885e4'),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        '登录名: ${_controller.user.username}',
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Fallowing',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '18',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
            child: Text(
              _controller.user.nickname!,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(
              _controller.user.personalDesc ?? '这个人有点懒，还没有写个人简介',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildOption(Icons.group_add, "Friends", true),
                buildOption(Icons.group, "Groups", true),
                buildOption(Icons.assignment_outlined, "订单", true, onTap: () {
                  print(1);
                }),
                buildOption(Icons.star, "收藏", true),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildOption(IconData icon, String text, bool top, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Icon(
              icon,
              size: 37.0,
              color: top ? Colors.white : Colors.grey,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15.0,
              color: top ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
