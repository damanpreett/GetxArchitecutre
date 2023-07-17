import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/constants_size.dart';
import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';

class ContainerWithIconTxt extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPress;
  final double iconSize;
  final double radius;
  final double height;
  final double width;
  final double buttonPadding;
  final Color textColor;
  final Color buttonColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final bool showText;
  final bool svg;
  final bool borderEnable;

  ContainerWithIconTxt(
      {Key? key,
      required this.image,
      required this.title,
      required this.onPress,
      this.iconSize = 20,
      this.radius = ConstantSize.containerWelcomeRadius,
      this.height = 0,
      this.width = 0,
      this.buttonPadding = ConstantSize.commonBtnPadding,
      this.textColor = Colors.white,
      this.buttonColor = AppColor.whiteColor,
      this.fontSize = ConstantSize.commonTxtSize,
      this.fontWeight = AppFonts.urbanistMediumWeight,
      this.fontFamily = AppFonts.urbanistFamily,this.showText=true,this.svg=false,this.borderEnable=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height > 0 ? height : Get.height * .06,
        width: width > 0 ? width : Get.width - (ConstantSize.screenPadding * 2),
        padding: EdgeInsets.all(buttonPadding  ),
        decoration: BoxDecoration(
            border: borderEnable?Border.all(color: AppColor.viewLineColor, width: 1):null,
            color: buttonColor,
            borderRadius: BorderRadius.circular(
               radius )),
        child: Center(
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: Get.width*.05),
                      width: iconSize,
                      height: iconSize,
                      child: svg==false?Image.asset(image):SvgPicture.asset(image))),
              showText? Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: fontSize,
                        color: AppColor.blackColor,
                        fontWeight: fontWeight,
                        fontFamily: fontFamily),
                    textAlign: TextAlign.center,
                  ),
                ),
              ):Container()
            ],
          ),
        ),
      ),
    );
  }
}
