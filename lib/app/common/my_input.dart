import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String label;
  final String? placeHolder;
  final bool line;

  const MyInput({
    required this.label,
    this.placeHolder,
    this.line = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: line ? 2 : 0,
        ),
        Container(
          height: 88,
          padding: EdgeInsets.only(left: 40, right: 20),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: placeHolder,
                    isCollapsed: true,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  onChanged: (String value) {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
