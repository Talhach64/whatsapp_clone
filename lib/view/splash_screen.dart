import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/resources/components/general_exception_widget.dart';

import '../resources/components/internet_exception_widget.dart';
import '../view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    splashScreen.isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Center(child:
          Text('Welcome \nBack',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),),
      ),
    );
  }
}
