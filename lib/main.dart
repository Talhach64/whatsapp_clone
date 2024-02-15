import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/resources/getx_localization/languages.dart';
import 'package:untitled/resources/routes/routes.dart';
import 'package:untitled/resources/routes/routes_name.dart';

void main() {
  runApp(
    GetMaterialApp(
      // initialRoute: RouteName.chaThread,
      translations: Languages(),
      locale: const Locale('en','US'),
      fallbackLocale: const Locale('en','US'),
      getPages: AppRoute.appRoutes(),
    ),
  );
}
