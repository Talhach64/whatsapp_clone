import 'package:flutter/material.dart';


class MyTextFormField extends StatelessWidget {
  final String label, hint;
  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;

  const MyTextFormField(
      {Key? key,
        required this.label,
        required this.hint,
        this.controller,
        this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        // cursorColor: primaryColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        // keyboardType: keyboard,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          // prefixIconColor: primaryColor,

          hintText: hint,
          labelText: label,
          // labelStyle: const TextStyle(color: primaryColor),
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
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}