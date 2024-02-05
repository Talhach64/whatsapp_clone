

import 'package:get/get.dart';
import 'package:untitled/resources/routes/routes_name.dart';
import 'package:untitled/view/login/login_view.dart';
import 'package:untitled/view/splash_screen.dart';

import '../../view/chat_thread/chat_thread.dart';

class AppRoute {


  static appRoutes () => [
    GetPage(name: RouteName.splashScreen, page: ()=> SplashScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRight
    ),
    GetPage(name: RouteName.chaThread, page: ()=> ChatThread(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRight
    ),
    GetPage(name: RouteName.loginView, page: ()=> LoginView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRight
    ),
   ];

}