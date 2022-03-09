import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> with TickerProviderStateMixin {
  final List drawerList = <DrawerList>[
    DrawerList(
      index: DrawerIndex.HOME,
      labelName: '首页',
      icon: Icon(Icons.home),
    ),
    DrawerList(
      index: DrawerIndex.FeedBack,
      labelName: '意见反馈',
      icon: Icon(Icons.feedback),
    ),
    DrawerList(
      index: DrawerIndex.SETTINGS,
      labelName: '通用设置',
      icon: Icon(Icons.settings),
    ),
    DrawerList(
      index: DrawerIndex.Share,
      labelName: '分享',
      icon: Icon(Icons.share),
    ),
    DrawerList(
      index: DrawerIndex.About,
      labelName: '关于我们',
      icon: Icon(Icons.info),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: Color(context.isDarkMode ? 0xff404040 : 0xFFEDF0F2),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            offset: const Offset(2.0, 4.0),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(60.0)),
                        child: Obx(
                          () => Get.find<UserController>().isLogin
                              ? Image.network(
                                  Get.find<UserController>().avatar,
                                  fit: BoxFit.cover,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    Get.toNamed(Routes.LOGIN, arguments: 0);
                                  },
                                  child: Image(
                                    image: AssetImage('assets/images/default_avatar.png'),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 4),
                      child: Obx(
                        () => GestureDetector(
                          onTap: Get.find<UserController>().user.nickname == null
                              ? () {
                                  Get.back();
                                  Get.toNamed(Routes.LOGIN, arguments: 0);
                                }
                              : null,
                          child: Text(
                            Get.find<UserController>().user.nickname ?? '请登录',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.6),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0.0),
                itemCount: drawerList.length,
                itemBuilder: (BuildContext context, int index) {
                  return inkwell(drawerList[index]);
                },
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.withOpacity(0.6),
            ),
            Column(
              children: <Widget>[
                Obx(
                  () => Get.find<UserController>().isLogin
                      ? ListTile(
                          title: Text(
                            'Sign Out',
                            style: TextStyle(
                              // fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              // color: AppTheme.darkText,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          trailing: Icon(
                            Icons.power_settings_new,
                            color: Colors.red,
                          ),
                          onTap: () {
                            Get.find<UserController>().logout();
                            Get.back();
                            showSuccessMessage('已退出登录');
                          },
                        )
                      : Container(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          if (listData.index == DrawerIndex.HOME) {
            Get.back();
          } else if (listData.index == DrawerIndex.FeedBack) {
            Get.back();
            Get.toNamed(Routes.FEEDBACK);
          } else if (listData.index == DrawerIndex.SETTINGS) {
            Get.back();
            Get.toNamed(Routes.GENERAL_SETTING);
          }
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                    decoration: BoxDecoration(
                      color: DrawerIndex.HOME == listData.index ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  listData.isAssetsImage
                      ? Container(
                          width: 24,
                          height: 24,
                          child: Image.asset(listData.imageName,
                              color: DrawerIndex.HOME == listData.index ? Colors.blue : Colors.black),
                        )
                      : Icon(
                          listData.icon?.icon,
                          color: DrawerIndex.HOME == listData.index
                              ? Colors.blue
                              : (context.isDarkMode ? Colors.white : Colors.black),
                        ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      // color: widget.screenIndex == listData.index ? Colors.blue : AppTheme.nearlyBlack,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            DrawerIndex.HOME == listData.index
                ? Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75 - 64,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(28),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(28),
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

enum DrawerIndex {
  HOME,
  FeedBack,
  SETTINGS,
  Share,
  About,
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex? index;
}
