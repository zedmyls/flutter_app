import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/user_controller.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/common/views/my_buttons.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../common/my_input.dart';
import '../../../../../common/network/global.dart';
import '../../../../../common/views/BottomSheetView.dart';
import '../controllers/update_info_controller.dart';

class UpdateInfoView extends GetView<UpdateInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Get.find<UserController>().avatar,
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
                      onPressed: () {
                        showMyBottomSheet([
                          BottomSheetItem(
                              title: '拍照',
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();
                                final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                                if (image != null) _cropImage(image);
                              }),
                          BottomSheetItem(
                              title: '从相册选择',
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();
                                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                if (image != null) _cropImage(image);
                              }),
                        ]);
                      },
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

  // 裁剪图片
  _cropImage(XFile image) async {
    var croppedFile = await ImageCropper().cropImage(
      cropStyle: CropStyle.circle,
      sourcePath: image.path,
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: '编辑图片',
        toolbarColor: Colors.white,
        toolbarWidgetColor: Colors.black,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    );

    if (croppedFile != null) {
      final res = await HttpUtils.instance.post(
        'upload',
        data: dio.FormData.fromMap(
          {
            'file': await dio.MultipartFile.fromFile(croppedFile.path),
          },
        ),
      );
      Get.find<UserController>().avatar = res.data['url'];
      showSuccessMessage('更新头像成功');
    }
  }
}
