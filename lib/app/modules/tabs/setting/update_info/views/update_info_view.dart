import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/constant.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/views/my_buttons.dart';
import 'package:get/get.dart';

import '../../../../../common/my_input.dart';
import '../controllers/update_info_controller.dart';

class UpdateInfoView extends GetView<UpdateInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: SafeArea(
        child: SizedBox(
          width: 200,
          height: 44,
          child: GradientButton(
            title: '提交',
            type: ButtonType.danger,
            onPressed: () {
              controller.submit();
            },
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.network(
                      defaultNetworkImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: MaterialButton(
                      minWidth: 0,
                      elevation: 0.5,
                      color: Colors.white,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.pink,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyInput(
                      label: '昵称',
                      line: false,
                      maxLength: 10,
                      initialValue: Get.find<UserController>().user.nickname,
                      focusToSelect: true,
                      onChanged: (value) {
                        controller.obsParams.update((val) {
                          val!.nickname = value;
                        });
                      },
                    ),
                    MyInput(
                      label: '个人简介',
                      maxLength: 50,
                      initialValue: Get.find<UserController>().user.personalDesc,
                      focusToSelect: true,
                      onChanged: (value) {
                        controller.obsParams.update((val) {
                          val!.personalDesc = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
