import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants_size.dart';
import '../../utils/utils.dart';
import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';

class InputFieldCommon extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final double fontSize;
  final Color txtColor;
  final Color hintTxtColor;
  final FontWeight fontWeight;
  final String fontFamily;
  final double borderRadius;
  final Color enableBorderColor;
  final Color focusBorderColor;
  final double leftRightPadding;
  final double topBottomPadding;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyBoardType;
  final int maxLines;
  final int? maxWords;
  final TextCapitalization textCapitalization;

  InputFieldCommon(
      {Key? key,
      required this.controller,
      required this.hint,
      this.fontSize = ConstantSize.commonTxtSize,
      this.txtColor = AppColor.blackColor,
      this.hintTxtColor = AppColor.viewLineColor,
      this.fontWeight = AppFonts.urbanistMediumWeight,
      this.fontFamily = AppFonts.urbanistFamily,
      this.borderRadius = ConstantSize.containerWelcomeRadius,
      this.enableBorderColor = AppColor.liteBorderColor,
      this.focusBorderColor = AppColor.backGroundColor,
      this.leftRightPadding = ConstantSize.commonBtnPadding * 2,
      this.topBottomPadding = 0,
      this.focusNode,
      this.nextFocusNode,
      this.keyBoardType = TextInputType.text,
      this.maxLines = 1,
      this.maxWords = null,
      this.textCapitalization= TextCapitalization.sentences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return maxWords == null
        ? keyBoardType==TextInputType.number?TextField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
      ],
      textCapitalization:textCapitalization,
      // maxLength:maxWords ,
      maxLines: maxLines,
      keyboardType: keyBoardType,
      focusNode: focusNode,
      onSubmitted: (value) {
        if (focusNode != null && nextFocusNode != null) {
          Utils.fieldFocusChange(context, focusNode!, nextFocusNode!);
        }
      },
      controller: controller,
      style: TextStyle(
          fontSize: fontSize,
          color: txtColor,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
      decoration: InputDecoration(
        // counter: SizedBox.shrink(),

          hintStyle: TextStyle(
              fontSize: ConstantSize.commonTxtSize,
              color: hintTxtColor,
              fontWeight: fontWeight,
              fontFamily: fontFamily),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: enableBorderColor)),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: focusBorderColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          contentPadding: EdgeInsets.only(
              left: leftRightPadding,
              right: leftRightPadding,
              top: topBottomPadding,
              bottom: topBottomPadding)),
    ):TextField(
      textCapitalization:textCapitalization,
            // maxLength:maxWords ,
            maxLines: maxLines,
            keyboardType: keyBoardType,
            focusNode: focusNode,
            onSubmitted: (value) {
              if (focusNode != null && nextFocusNode != null) {
                Utils.fieldFocusChange(context, focusNode!, nextFocusNode!);
              }
            },
            controller: controller,
            style: TextStyle(
                fontSize: fontSize,
                color: txtColor,
                fontWeight: fontWeight,
                fontFamily: fontFamily),
            decoration: InputDecoration(
                // counter: SizedBox.shrink(),

                hintStyle: TextStyle(
                    fontSize: ConstantSize.commonTxtSize,
                    color: hintTxtColor,
                    fontWeight: fontWeight,
                    fontFamily: fontFamily),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: enableBorderColor)),
                hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: focusBorderColor)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                contentPadding: EdgeInsets.only(
                    left: leftRightPadding,
                    right: leftRightPadding,
                    top: topBottomPadding,
                    bottom: topBottomPadding)),
          )
        : keyBoardType==TextInputType.number?TextField(
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
      ],
            maxLength:maxWords ,
            maxLines: maxLines,
            keyboardType: keyBoardType,

            focusNode: focusNode,
            onSubmitted: (value) {
              if (focusNode != null && nextFocusNode != null) {
                Utils.fieldFocusChange(context, focusNode!, nextFocusNode!);
              }
            },
            controller: controller,
            style: TextStyle(
                fontSize: fontSize,
                color: txtColor,
                fontWeight: fontWeight,
                fontFamily: fontFamily),
            decoration: InputDecoration(
                counter: SizedBox.shrink(),
                hintStyle: TextStyle(
                    fontSize: ConstantSize.commonTxtSize,
                    color: hintTxtColor,
                    fontWeight: fontWeight,
                    fontFamily: fontFamily),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: enableBorderColor)),
                hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide(color: focusBorderColor)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                contentPadding: EdgeInsets.only(
                    left: leftRightPadding,
                    right: leftRightPadding,
                    top: topBottomPadding,
                    bottom: topBottomPadding)),
          ):TextField(
      maxLength:maxWords ,
      maxLines: maxLines,
      keyboardType: keyBoardType,

      focusNode: focusNode,
      onSubmitted: (value) {
        if (focusNode != null && nextFocusNode != null) {
          Utils.fieldFocusChange(context, focusNode!, nextFocusNode!);
        }
      },
      controller: controller,
      style: TextStyle(
          fontSize: fontSize,
          color: txtColor,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
      decoration: InputDecoration(
          counter: SizedBox.shrink(),
          hintStyle: TextStyle(
              fontSize: ConstantSize.commonTxtSize,
              color: hintTxtColor,
              fontWeight: fontWeight,
              fontFamily: fontFamily),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: enableBorderColor)),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: focusBorderColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          contentPadding: EdgeInsets.only(
              left: leftRightPadding,
              right: leftRightPadding,
              top: topBottomPadding,
              bottom: topBottomPadding)),
    );
  }
}
