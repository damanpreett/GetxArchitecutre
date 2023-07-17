import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class LoadSvg extends StatelessWidget{
  final String svgPath;
  final double height;
  final double width;
  final BoxFit fit;

  const LoadSvg({super.key,required this.svgPath,this.height=0,this.width=0,this.fit=BoxFit.scaleDown});
  @override
  Widget build(BuildContext context) {
    return height>0?SvgPicture.asset(
        svgPath,
        semanticsLabel: svgPath,
      height:height ,
      width: width,
        fit:fit
    ):SvgPicture.asset(
      svgPath,
      semanticsLabel: svgPath,
    );
  }
}