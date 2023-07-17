import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/constants_size.dart';
import '../assets/svg_assets.dart';
import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';

class ContainerWithDropDownBtn extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  final double width;
  final double buttonPadding;
  final Color textColor;
  final TextAlign textAlign;
  final Color backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final double borderRadius;
  final Color borderColor;
  final bool enableBorder;
  final bool enableDropDownBtn;
  final double leftRightPadding;
  final double topBottomPadding;
  final String dropDownIcon;

   ContainerWithDropDownBtn(
      {Key? key,
        required this.title,
        required this.onPress,
        this.fontSize = ConstantSize.commonTxtSize,
        this.textColor = AppColor.viewLineColor,
        this.borderRadius=ConstantSize.containerWelcomeRadius,
        this.leftRightPadding=ConstantSize.commonBtnPadding * 2,
        this.buttonPadding =  ConstantSize.commonBtnPadding*1.5,
        this.height = 0,
        this.width = 0,
        this.textAlign=TextAlign.start,
        this.backgroundColor = AppColor.whiteColor,
        this.fontWeight = AppFonts.urbanistMediumWeight,
        this.fontFamily = AppFonts.urbanistFamily,
        this.borderColor=AppColor.dividerColor,
        this.topBottomPadding=0,
        this.enableBorder=true,
        this.enableDropDownBtn=true,
        this.dropDownIcon=SvgAssets.dropDownArrow
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width>0?width:Get.width-(ConstantSize.screenPadding*2),
        padding: EdgeInsets.only(top: buttonPadding,bottom: buttonPadding,left: leftRightPadding,right: leftRightPadding),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: fontWeight,
                    fontFamily: fontFamily),
                textAlign:textAlign,
              ),
            ),
            enableDropDownBtn?SvgPicture.asset(dropDownIcon,
            semanticsLabel: 'Droup list Arrow'
            // semanticsLabel: 'Acme Logo',width: ConstantSize.smallIconSize,
        ):Container()
          ],
        ),
      ),
    );
  }
}
