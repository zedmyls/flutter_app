import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({
    Widget? title,
    final List<Widget>? actions,
    Color backgroundColor = Colors.white,
    PreferredSize? bottom,
  }) : super(
          title: title,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: backgroundColor,
          elevation: 4,
          actions: actions,
          bottom: bottom,
        );
}
