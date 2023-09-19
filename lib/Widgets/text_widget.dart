import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  String? text;
  double? fontSize;
  Function? onPressed;

  TextWidget({
    super.key,
    this.text,
    this.fontSize,
    this.onPressed,
  });

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed!();
      },
      child: Text(
        widget.text!,
        style: TextStyle(
          fontSize: widget.fontSize ?? 13,
        ),
      ),
    );
  }
}
