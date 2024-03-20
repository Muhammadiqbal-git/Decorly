import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {
  final Color colorCard;
  final Color? borderColor;
  final double borderWidth;
  final double widthCard;
  final double heightCard;
  final EdgeInsets padding;
  final Widget childCard;
  final double opacityCard;
  final Alignment align;
  const CustomCard2(
      {super.key,
      required this.colorCard,
      required this.widthCard,
      required this.heightCard,
      required this.childCard,
      this.padding = EdgeInsets.zero,
      this.borderColor,
      this.align = Alignment.center,
      this.borderWidth = 1.0,
      this.opacityCard = 1.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthCard,
      height: heightCard,
      child: CustomPaint(
        painter: ButtonPainter(
            color: borderColor ?? colorCard, opacity: opacityCard),
        child: Center(
          child: SizedBox(
            width: widthCard - borderWidth,
            height: heightCard - borderWidth,
            child: CustomPaint(
              painter: ButtonPainter(color: colorCard),
              child: Container(
                padding: padding,
                alignment: align, child: childCard),
            ),
          ),
        ),
      ),
    );
  }
}
