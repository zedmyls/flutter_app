import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/views/my_app_bar.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          '分类',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'CategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
