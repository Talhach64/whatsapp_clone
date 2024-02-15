import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:untitled/models/login/user_model.dart';
import 'package:untitled/resources/routes/routes_name.dart';
import 'package:untitled/view_models/controller/user_preference/user_preference_view_model.dart';

import '../../data/repository/login_repository/login_repository.dart';
import '../../utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passFocusNode = FocusNode().obs;
  final RxBool isObsecure = true.obs;
  final RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passController.value.text,
    };

    _api.loginApi(data).then((value) {
      loading.value = false;
      userPreference.setUser(UserModel.fromJson(value)).then((value) {
        Get.toNamed(RouteName.chaThread);
      }).onError((error, stackTrace) {

      });
      Utils.snackBar("Login", "Login successfully");
    }).onError((error, stackTrace) {
      loading.value = false;
      if (kDebugMode) {
        print(error.toString());
        print(stackTrace);
      }

      Utils.snackBar("Error", error.toString());
    });
  }
}
