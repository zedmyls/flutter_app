import 'package:flutter/material.dart';

Widget _customOutlinedButton(
  String title,
  Color lineColor,
  VoidCallback? onPressed,
  Color textColor,
) {
  return Opacity(
    opacity: onPressed != null ? 1 : .5,
    child: OutlinedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            color: lineColor,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ),
  );
}

enum ButtonType { success, warning, danger, info }

extension ButtonTypeExtension on ButtonType {
  Color get color {
    switch (this) {
      case ButtonType.success:
        return Color(0xFF2DBF64);
      case ButtonType.danger:
        return Color(0xFFED2F2F);
      case ButtonType.info:
        return Color(0xFF02A4E2);
      case ButtonType.warning:
        return Color(0xFFFF6F10);
    }
  }

  List<Color> get colors {
    switch (this) {
      case ButtonType.success:
        return [
          Colors.greenAccent,
          Color(0xFF2DBF64),
        ];
      case ButtonType.danger:
        return [
          Colors.redAccent,
          Color(0xFFED2F2F),
        ];
      case ButtonType.info:
        return [
          Colors.lightBlueAccent,
          Colors.blueAccent,
        ];
      case ButtonType.warning:
        return [
          Colors.orangeAccent,
          Color(0xFFFF6F10),
        ];
    }
  }
}

class LineButton extends StatelessWidget {
  final ButtonType type;
  final String title;
  final VoidCallback? onPressed;
  final Color? textColor;

  const LineButton({
    Key? key,
    required this.type,
    required this.title,
    this.onPressed,
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _customOutlinedButton(
      title,
      type.color,
      onPressed,
      textColor ?? type.color,
    );
  }
}

class GradientButton extends StatelessWidget {
  final ButtonType type;
  final Color? splashColor;
  final Color? textColor;
  final String title;
  final VoidCallback? onPressed;
  final double fontSize;
  final FontWeight fontWeight;

  const GradientButton({
    Key? key,
    this.splashColor,
    this.textColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    required this.title,
    required this.type,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed != null ? 1 : .5,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onPressed,
        splashColor: splashColor ?? Colors.blue,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(colors: type.colors),
            boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.08))],
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Text(
                title,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
