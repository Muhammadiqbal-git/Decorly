import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() function;
  final Color colorButton;
  final double heightButton;
  final double widthButton;
  final Widget childButton;
  final double opacityButton;
  const CustomButton(
      {super.key,
      required this.function,
      required this.colorButton,
      required this.heightButton,
      required this.widthButton,
      required this.childButton,
      this.opacityButton = 1.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: function,
      child: SizedBox(
        height: heightButton,
        width: widthButton,
        child: CustomPaint(
          painter: ButtonPainter(color: colorButton, opacity: opacityButton),
          child: Center(child: childButton),
        ),
      ),
    );
  }
}
