import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../utils/constants.dart';
import '../../utils/constants_size.dart';
import '../../utils/share_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backGroundColor
            .withOpacity(ConstantSize.backGroundColorOpacity),
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: SafeArea(
            child: SizedBox(
                width: Get.width * .5,
                height: Get.height * .3,
                child: Image.asset(
                  ImageAssets.splashImage,
                  fit: BoxFit.fill,
                ))),
      ),
    );
  }

  void init() async{
      bool userType = await SharePref.getBoolean(Constants.loginAsCustomer) ;
      int value=userType?2:1;
      bool isLogin=await SharePref.getBoolean(Constants.homeLogin) ;
      Future.delayed(const Duration(seconds: 3), () {
        // if(isLogin) {
        //   if (value == 1) {
        //     Get.offNamed(RoutesName.homeScreen);
        //   } else {
        //     Get.offNamed(RoutesName.homeCustomerScreen);
        //   }
        // }else{
        //   Get.offNamed(RoutesName.introScreen);
        // }
      });
  }
}
