import 'dart:async';

import 'package:get/get.dart';
import 'package:untitled/resources/routes/routes_name.dart';

class SplashServices {


  void isLogin() {
    Timer(
        const Duration(seconds: 1),
            () => Get.toNamed(RouteName.loginView));
  }

}