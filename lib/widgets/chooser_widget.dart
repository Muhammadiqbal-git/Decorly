import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class ChooserWidget extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? selectedColor;
  final Widget child;
  const ChooserWidget(
      {super.key,
      this.width,
      this.height,
      this.padding,
      this.color,
      this.selectedColor,
      required this.child});

  @override
  State<ChooserWidget> createState() => _ChooserWidgetState();
}

class _ChooserWidgetState extends State<ChooserWidget> {
  GlobalKey tes = GlobalKey();
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: index == selected ? secondary_cr : white_cr,
                borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Container(
                height: widget.height,
                width: widget.width,
                alignment: Alignment.center,
                padding: widget.padding,
                decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(12)),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
