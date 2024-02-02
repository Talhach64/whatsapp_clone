import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/resources/components/general_exception_widget.dart';

import '../resources/components/internet_exception_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: InternetExceptionWidget(onTap: (){}),
    );
  }
}
