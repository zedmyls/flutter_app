import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String img;
  final String tips;

  const NoData({
    Key? key,
    this.img = 'assets/images/no_data.png',
    this.tips = '暂无数据',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(img),
        ),
        Text(
          tips,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
