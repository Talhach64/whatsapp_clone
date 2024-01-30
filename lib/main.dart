import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/chat_thread.dart';
import 'test_example_code.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/ChatThread',
      getPages: [
        GetPage(name: '/ChatThread', page: () => const ChatThread()),
        GetPage(name: '/Demo', page: () => const Demo()),
      ],
    ),
  );
}
