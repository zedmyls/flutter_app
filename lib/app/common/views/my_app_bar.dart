import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    required BuildContext context,
    String? title,
    Widget? titleWidget,
    final List<Widget>? actions,
    double elevation = 4,
    PreferredSize? bottom,
  }) : super(
          title: titleWidget ??
              Text(
                title ?? '',
                style: TextStyle(
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
          iconTheme: IconThemeData(
            color: context.isDarkMode ? Colors.white : Colors.black,
          ),
          backgroundColor: context.isDarkMode ? Color(0xff303030) : Colors.white,
          elevation: elevation,
          actions: actions,
          bottom: bottom,
        );
}
