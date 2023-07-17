import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/colors/app_color.dart';


class Utils {
/*
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }*/

  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
    ));
  }
  static void showDialogProgressDialog(BuildContext context, bool isLoading){
   if(isLoading==false){
     // Get.back();
     Navigator.pop(context);
   }else{
    showDialog(
       barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: CupertinoActivityIndicator(),
            ),
          ),
        ),
      ),
    );
  }
  }

  static void snackBar(String title, String? msg) {
    Get.snackbar(title, msg??'',snackPosition: SnackPosition.TOP,backgroundColor: AppColor.liteBackGroundColor);
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus( FocusNode());
  }

}
