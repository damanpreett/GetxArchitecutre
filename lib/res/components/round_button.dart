import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants_size.dart';
import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double radius;
  final double height;
  final double width;
  final double buttonPadding;
  final Color textColor;
  final Color buttonColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final double horizontalPadding;
  final Alignment textAlign;

  RoundButton(
      {Key? key,
      required this.title,
      required this.onPress,
      this.radius = ConstantSize.commonBtnRadius,
      this.height = 0,
      this.width = 0,
        this.horizontalPadding=0,
      this.buttonPadding = ConstantSize.commonBtnPadding,
      this.textColor = Colors.white,
      this.textAlign = Alignment.center,
      this.buttonColor = AppColor.backGroundBtnColor,
      this.fontSize = ConstantSize.commonBtnTxtSize,this.fontFamily=AppFonts.urbanistFamily,this.fontWeight=AppFonts.urbanistBoldWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: textAlign,
        height: height > 0 ? height : Get.height * .06,
        width: width > 0 ? width : Get.width - (ConstantSize.screenPadding * 2),
        padding:horizontalPadding>0?EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: buttonPadding): EdgeInsets.all(buttonPadding),
        decoration: BoxDecoration(
            color: buttonColor.withOpacity(ConstantSize.backGroundColorOpacity),
            borderRadius: BorderRadius.circular(radius)),
        child: Text(
          title,
          style: TextStyle(
              color: textColor,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              fontSize: fontSize),
        ),
      ),
    );
  }
}
