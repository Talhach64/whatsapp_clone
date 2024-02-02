import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  const RoundButton(
      {super.key,
      this.buttonColor = Colors.blueAccent,
      this.textColor = Colors.white,
      required this.title,
      required this.onPress,
      this.height = 50,
      this.width = 60,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: loading
          ? const CircularProgressIndicator()
          : Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
    );
  }
}
