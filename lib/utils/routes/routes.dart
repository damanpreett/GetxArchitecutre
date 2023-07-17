import 'package:get/get.dart';
import '../../utils/routes/routes_name.dart';
import '../../views/splash_view/splash_screen.dart';
import '../constants_size.dart';

class Routes {
  static appRoutes() => [
                GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
      ];
}
