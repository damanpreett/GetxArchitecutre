import 'package:flutter/material.dart';

import '../../utils/constants_size.dart';
import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';
class TextBoldUrbanist extends StatelessWidget{
  final String txt;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextAlign textAlign;
  final double textSize;
  final Color txtColor;
  final TextOverflow textOverFlow;
  TextBoldUrbanist({Key? key,required this.txt,this.fontWeight=AppFonts.urbanistBoldWeight,
    this.fontFamily=AppFonts.urbanistFamily,this.textAlign=TextAlign.center,
    this.textSize=ConstantSize.commonBoldTxtSize,this.txtColor=AppColor.blackColor,
    this.textOverFlow=TextOverflow.visible}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Text(
        txt,
        style: TextStyle(
            fontSize: textSize,
            color: txtColor,
            fontWeight: fontWeight,
            fontFamily: fontFamily,overflow: textOverFlow),
        textAlign: textAlign,
      );
  }

}