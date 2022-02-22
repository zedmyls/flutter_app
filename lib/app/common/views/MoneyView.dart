import 'package:flutter/material.dart';
import 'package:flutter_app/app/common/utils.dart';
import 'package:get/get.dart';

class MoneyView extends StatelessWidget {
  final String prefix;
  final int money;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;

  const MoneyView({
    Key? key,
    this.prefix = '',
    required this.money,
    this.color,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$prefix￥${FormatUtils.formatMoney(money).split('.')[0]}.',
            style: TextStyle(
              color: color ?? (Get.isDarkMode ? Colors.white : Colors.black),
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: FormatUtils.formatMoney(money).split('.')[1],
            style: TextStyle(
              color: color ?? (Get.isDarkMode ? Colors.white : Colors.black),
              fontWeight: fontWeight,
              fontSize: fontSize - 6,
            ),
          ),
        ],
      ),
    );
  }
}
