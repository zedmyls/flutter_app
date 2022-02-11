import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  final String txt;

  const TagView({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Color(0xffee0a24),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        txt,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }
}
