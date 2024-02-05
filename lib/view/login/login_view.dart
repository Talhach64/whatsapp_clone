import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/resources/components/round_button.dart';
import 'package:untitled/view_models/controller/login_view_model.dart';

import 'custom_input_field.dart';
import 'custom_password_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginVM = Get.put(LoginViewModel());
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: autoValidateMode,
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10.0),
                    // const Img(),
                    const Text(
                      'Log in',
                      style: TextStyle(fontSize: 35),
                    ),
                    const SizedBox(height: 10.0),
                    MyTextFormField(
                        label: 'Email',
                        hint: 'Email',
                        controller: loginVM.emailController.value,
                        validator: (String? value) => value!.isEmpty
                            ? "Invalid Email or Password"
                            : null),
                    MyPassField(
                      label: 'Password',
                      hint: 'Password',
                      controller: loginVM.passController.value,
                      validator: (String? value) =>
                          value!.isEmpty ? "Invalid Email or Password" : null,
                      keyboard: TextInputType.text,
                    ),
                    Obx(
                      () => RoundButton(
                          width: 200,
                          title: "Login",
                          loading: loginVM.loading.value,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              loginVM.loginApi();
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//     child: Material(
//       color: const Color(0xff222222),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             children: [
//
//
//               Obx(
//                   ()=> RoundButton(
//                   width: 200,
//                     title: "Login",
//                     loading: loginVM.loading.value,
//                     onTap: () {
//                       if (_formKey.currentState!.validate()) {
//                         loginVM.loginApi();
//                       }
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
}
