import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:flutter_app/app/common/views/my_buttons.dart';
import 'package:get/get.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '意见反馈',
        context: context,
      ),
      body: Column(
        children: [
          _buildFeedback(),
          SizedBox(height: 30),
          Container(
            width: 300,
            height: 40,
            child: Obx(
              () => GradientButton(
                type: ButtonType.info,
                onPressed: controller.params.isNotEmpty
                    ? () {
                        Get.back();
                        showSuccessMessage('您的反馈已成功提交');
                      }
                    : null,
                title: '提交',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedback() {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Color(0xff404040) : Colors.white,
      ),
      padding: EdgeInsets.all(10),
      child: TextField(
        cursorColor: Get.isDarkMode ? Colors.white : Colors.lightBlueAccent,
        maxLines: 6,
        maxLength: 200,
        decoration: InputDecoration(
          hintText: '您的反馈就是我们最大的动力',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        onChanged: (value) {
          controller.params = value;
        },
      ),
    );
  }
}
