import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class ChooserWidget extends StatefulWidget {
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? selectedColor;
  final List<Widget> children;
  final Function(int value)? onSelected;
  const ChooserWidget(
      {super.key,
      this.width,
      required this.height,
      this.padding,
      this.color,
      this.selectedColor,
      this.onSelected,
      required this.children});

  @override
  State<ChooserWidget> createState() => _ChooserWidgetState();
}

class _ChooserWidgetState extends State<ChooserWidget> {
  GlobalKey tes = GlobalKey();
  int selected = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.children.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: index == selected ? secondary_cr : white_cr,
              borderRadius: BorderRadius.circular(16)),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              setState(() {
                selected = index;
              });
              widget.onSelected?.call(index);
            },
            child: widget.children[index],
          ),
        ),
      ),
    );
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //       children: widget.children
    //           .asMap()
    //           .map((index, value) => MapEntry(
    //                 index,
    //                 Container(
    //                   margin: EdgeInsets.symmetric(horizontal: 2),
    //                   padding: EdgeInsets.all(6),
    //                   decoration: BoxDecoration(
    //                       color: index == selected ? secondary_cr : white_cr,
    //                       borderRadius: BorderRadius.circular(16)),
    //                   alignment: Alignment.center,
    //                   child: InkWell(
    //                     onTap: () {
    //                       setState(() {
    //                         selected = index;
    //                       });
    //                     },
    //                     child: Container(
    //                       height: widget.height,
    //                       width: widget.width,
    //                       alignment: Alignment.center,
    //                       padding: widget.padding,
    //                       decoration: BoxDecoration(
    //                           color: widget.color,
    //                           borderRadius: BorderRadius.circular(12)),
    //                       child: value,
    //                     ),
    //                   ),
    //                 ),
    //               ))
    //           .values
    //           .toList()),
    // );
  }
}
