

import 'package:get/get.dart';
import 'package:untitled/resources/routes/routes_name.dart';
import 'package:untitled/view/splash_screen.dart';

class AppRoute {


  static appRoutes () => [
    GetPage(name: RouteName.splashScreen, page: ()=> SplashScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRight
    ),
   ];

}