import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const AppTextWidget(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textScaler: TextScaler.noScaling,
      textAlign: textAlign,
      overflow: overflow,
      text,
      style: style != null
          ? style!.copyWith(fontFamily: "kenankus")
          : TextStyle(fontFamily: "kenankus"),
    );
  }
}
