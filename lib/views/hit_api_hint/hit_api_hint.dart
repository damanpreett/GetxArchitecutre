import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../respository/auth_repository.dart';
import '../../utils/constants.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';

class HitApiHint extends GetxController{
  final _myRepo = AuthRepository();

  void hitingApiFunction(){
    if (Constants.apiWorking) {
      BuildContext? context = Get.context;
      Utils.showDialogProgressDialog(context!, true);
      _myRepo.loginApi('data').then((value ) {
        Utils.showDialogProgressDialog(context, false);

      }).onError((error, stackTrace) {
        Utils.showDialogProgressDialog(context, false);
        Utils.snackBar('Error', error.toString());
      });
    } else {
      Get.offNamed(RoutesName.homeScreen)?.then((value) async {
        Get.delete<HitApiHint>();
      });
    }
  }
}