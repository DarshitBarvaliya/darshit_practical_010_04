import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  String? text;
  Color? textColor;
  double? fontSize;
  int? maxLine;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  bool? softWrap;

  CommonText({
    super.key,
    this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.maxLine,
    this.textOverflow,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLine,
      overflow: textOverflow,
      softWrap: softWrap,
    );
  }
}