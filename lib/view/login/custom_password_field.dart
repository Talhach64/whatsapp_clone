import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/controller/login_view_model.dart';


class MyPassField extends StatefulWidget {
  final String label, hint;
  final TextEditingController controller;
  final TextInputType keyboard;
  final FormFieldValidator<String?>? validator;


  const MyPassField(
      {Key? key,
        required this.label,
        required this.hint,
        required this.controller,
        this.validator,
        required this.keyboard})
      : super(key: key);

  @override
  State<MyPassField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyPassField> {
  LoginViewModel loginVM = Get.put(LoginViewModel());


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Obx(()=>TextFormField(
        // cursorColor: primaryColor,
        obscureText: loginVM.isObsecure.value,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        keyboardType: widget.keyboard,
        //  validator: validator,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          // prefixIconColor: primaryColor,
          // labelStyle: const TextStyle(color: primaryColor),
          hintText: widget.hint,
          labelText: widget.label,
          suffixIcon: GestureDetector(
            onTap: () => loginVM.isObsecure.value = !loginVM.isObsecure.value,
            child: loginVM.isObsecure.value
                ? const Icon(
              Icons.visibility,
              // color: primaryColor,
            )
                : const Icon(Icons.visibility_off,
              // color: primaryColor
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.yellow),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusColor: Colors.yellow,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),),
    );
  }
}