import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() function;
  final Color colorButton;
  final Color? borderColor;
  final double widthButton;
  final double heightButton;
  final Widget childButton;
  final double opacityButton;
  const CustomButton(
      {super.key,
      required this.function,
      required this.colorButton,
      required this.widthButton,
      required this.heightButton,
      required this.childButton,
      this.borderColor,
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
          painter: ButtonPainter(
              color: colorButton,
              borderColor: borderColor,
              opacity: opacityButton),
          child: Center(child: childButton),
        ),
      ),
    );
  }
}
