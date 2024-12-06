import 'package:flutter/material.dart';
import '../utils/colors.dart';

// ignore: must_be_immutable
class TitleTextView extends StatelessWidget {
  TitleTextView(this.text,
      {super.key,
        this.textAlign,
        this.color,
        this.fontSize,
        this.softWrap,
        this.maxLines,
        this.textOverflow,
        this.fontWeight,
        this.fontStyle,
        this.isGradiant,
        this.textDecoration,
        this.fontFamily});

  final String text;
  TextAlign? textAlign = TextAlign.start;
  Color? color = Colors.black;

  double? fontSize = 13;
  bool? softWrap = true;
  bool? isGradiant = false;
  int? maxLines;
  TextOverflow? textOverflow = TextOverflow.ellipsis;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextDecoration? textDecoration;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: softWrap,
      maxLines: maxLines,
      style: TextStyle(
        letterSpacing: 0,
        height: 1,
        decoration: TextDecoration.none,
        color: (color == null) ? ColorConst.black : color,
        fontSize: (fontSize == null) ? 14 : fontSize,
        fontWeight: (fontWeight == null) ? FontWeight.normal : fontWeight,
        // fontFamily: fontWeight == FontWeight.w700
        //     ? Font.robotoBold
        //     : fontWeight == FontWeight.w600
        //     ? Font.robotoMed
        //     : fontWeight == FontWeight.w400
        //     ? Font.robotoReg
        //     : Font.robotoReg,
      ),
    );
  }
}
