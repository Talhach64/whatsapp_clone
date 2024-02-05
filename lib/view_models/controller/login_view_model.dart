import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/repository/login_repository/login_repository.dart';
import '../../utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

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
      Utils.snackBar("Login", "Login successfully");
    }).onError((error, stackTrace) {
      loading.value = false;
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.snackBar("Error", error.toString());
    });
  }
}
