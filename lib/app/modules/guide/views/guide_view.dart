import 'package:flutter/material.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class GuideView extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Welcome to Flutter App'),
          Text(
            '随时随地，为您的宝贝选购礼物',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/guide/start_up_1.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('丰富商品'),
          Text(
            '让您的选择多种多样',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/guide/start_up_2.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('贴心设计'),
          Text(
            '精简UI，只为让您满意',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/images/guide/start_up_3.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Get.offAndToNamed(Routes.TABS);
              },
              showSkipButton: false,
              doneText: Text(
                "开始",
              ),
              pageButtonsColor: Colors.indigo,
              pageButtonTextStyles: TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),
            Positioned(
                top: 20.0,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Image.asset(
                  'assets/images/guide/logo.png',
                  width: 100,
                ))
          ],
        ),
      ),
    );
  }
}
