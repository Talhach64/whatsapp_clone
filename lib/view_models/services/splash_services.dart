import 'dart:async';

import 'package:get/get.dart';
import 'package:untitled/resources/routes/routes_name.dart';
import 'package:untitled/view_models/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) => {
          if (value.token!.isEmpty)
            {
              Timer(const Duration(seconds: 2),
                  () => Get.toNamed(RouteName.loginView))
            }
          else
            {
              Timer(const Duration(seconds: 2),
                  () => Get.toNamed(RouteName.chaThread))
            }
        });
  }
}
