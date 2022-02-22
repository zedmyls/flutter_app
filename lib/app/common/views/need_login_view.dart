import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_buttons.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class NeedLoginView extends StatelessWidget {
  const NeedLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('assets/images/need_auth.png'),
        ),
        Text(
          '请先登录~~',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 100,
          child: GradientButton(
            type: ButtonType.info,
            onPressed: () {
              Get.toNamed(Routes.LOGIN, arguments: 0);
            },
            title: '去登录',
          ),
        ),
      ],
    );
  }
}
