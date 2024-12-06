// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';

import 'custom_text.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.child,
      required this.onPressed,
      required this.color,
      required this.borderRadius});
  final dynamic child;
  final dynamic onPressed;
  final Color color;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(10),
      color: color,
      child: child,
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }
}

class CustomButton extends StatelessWidget {
  double? height;
  double? width;
  double? radius;
  double? fontSize;
  final String text;
  final Color textColor;
  final Color bgColor;
  final dynamic onTap;
  bool? showBorder;
  final Color borderColor;
  FontWeight? fontWeight;

  CustomButton(
      {super.key,
      this.height,
      this.width,
      required this.text,
      required this.textColor,
      this.radius,
      this.fontSize,
      required this.bgColor,
      required this.onTap,
      this.showBorder,
      required this.borderColor,
      this.fontWeight
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 6),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: CupertinoButton(
        color: bgColor,
        padding: const EdgeInsets.all(10),
        onPressed: onTap,
        borderRadius: BorderRadius.circular(radius ?? 6),
        child: TitleTextView(
          text,
          fontSize: fontSize ?? 13,
          fontWeight: fontWeight ?? FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
