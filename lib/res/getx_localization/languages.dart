import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'welcomeScreenTitle':'Let’s you in',
      'internet_exception':"No InterConnection please\nPlease check internet connection.",
      'retry':"Retry",
    },
    'ur_Pk':{
      'email_hint':'入りましょう',
    },
  };
}

/*
// For update lanuage use below line
//Get.updateLocale(Locale('ur','PK'));

// for getting data accoding to launage use below line
// Text('email_hint'.tr)
    */