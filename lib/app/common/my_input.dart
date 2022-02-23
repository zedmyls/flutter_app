import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInput extends StatefulWidget {
  final String label;
  final String? placeHolder;
  final String? initialValue;
  final bool line;
  final Widget? otherWidget;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;
  final int maxLength;

  const MyInput({
    required this.label,
    this.placeHolder,
    this.initialValue,
    this.line = true,
    this.otherWidget,
    this.keyboardType,
    this.onChanged,
    this.maxLength = 20,
    Key? key,
  }) : super(key: key);

  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }

    return Column(
      children: [
        Divider(
          height: widget.line ? 2 : 0,
        ),
        Container(
          height: 58,
          color: Get.isDarkMode ? Color(0xff303030) : Colors.white,
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Row(
            children: [
              Text(
                widget.label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 10),
              Expanded(
                child: widget.otherWidget == null
                    ? TextFormField(
                        controller: _controller,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return '${widget.label}不能为空';
                          }
                          return null;
                        },
                        maxLength: widget.maxLength,
                        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                        keyboardType: widget.keyboardType,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: widget.placeHolder,
                          hintStyle: TextStyle(fontSize: 14),
                          isCollapsed: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                        onChanged: widget.onChanged,
                      )
                    : widget.otherWidget!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
