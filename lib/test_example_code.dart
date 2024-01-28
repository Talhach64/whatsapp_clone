
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  RxDouble opacity = .4.obs;

  setOpacity(value) {
    opacity.value = value;
  }
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  ScreenController screenController = Get.put(ScreenController());

  double opacity = .4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            Obx(() => Container(
                  height: Get.height * .1,
                  width: Get.width * .2,
                  color: Colors.red.withOpacity(screenController.opacity.value),
                )),
            const SizedBox(height: 20),
            Obx(() => Slider(
                value: screenController.opacity.value,
                onChanged: (value) {
                  screenController.setOpacity(value);
                }))
          ],
        ),
      ),
    );
  }
}
