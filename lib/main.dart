import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/resources/getx_localization/languages.dart';
import 'package:untitled/resources/routes/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      // initialRoute: '/ChatThread',
      translations: Languages(),
      locale: const Locale('en','US'),
      fallbackLocale: const Locale('en','US'),
      getPages: AppRoute.appRoutes(),
    ),
  );
}
