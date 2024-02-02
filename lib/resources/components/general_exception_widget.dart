import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/resources/colors/app_color.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onTap;

  const GeneralExceptionWidget({super.key, required this.onTap});

  @override
  State<GeneralExceptionWidget> createState() =>
      _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: height * .15),
          const Icon(
            Icons.cloud_off,
            color: Colors.red,
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
                child: Text(
                  'general_exception'.tr,
                  textAlign: TextAlign.center,
                )),
          ),
          SizedBox(height: height * .15),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              height: 44,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  'Retry',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
