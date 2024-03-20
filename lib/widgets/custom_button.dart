import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() function;
  final Color colorButton;
  final Color? borderColor;
  final double borderWidth;
  final double widthButton;
  final double heightButton;
  final Widget childButton;
  final double opacityButton;
  final List<BoxShadow>? boxShadow;
  const CustomButton(
      {super.key,
      required this.function,
      required this.colorButton,
      required this.widthButton,
      required this.heightButton,
      required this.childButton,
      this.boxShadow,
      this.borderColor,
      this.borderWidth = 1.0,
      this.opacityButton = 1.0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: function,
      child: Container(
        width: widthButton,
        height: heightButton,
        decoration: BoxDecoration(
          boxShadow: boxShadow
        ),
        child: CustomPaint(
          painter: ButtonPainter(
              color: borderColor ?? colorButton, opacity: opacityButton),
          child: Center(
            child: SizedBox(
              width: widthButton - borderWidth,
              height: heightButton - borderWidth,
              child: CustomPaint(
                painter: ButtonPainter(color: colorButton),
                child: Center( child: childButton),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
