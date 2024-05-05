import 'package:flutter/material.dart';

import '../theme.dart';

class CubeSwipeWidget extends StatefulWidget {
  final double width;
  final double height;
  final Color? bgColor;
  final Function()? onTap;
  final Function()? onLongPress;
  final Function(int val)? onPageChanged;

  final List<Widget> children;

  const CubeSwipeWidget({
    required this.width,
    required this.height,
    required this.children,
    this.bgColor,
    this.onTap,
    this.onLongPress,
    this.onPageChanged,
    super.key,
  });

  
  @override
  State<CubeSwipeWidget> createState() => _CubeSwipeWidgetState();
  
}

class _CubeSwipeWidgetState extends State<CubeSwipeWidget> {
  late PageController _pageC;

  void page(){
    print("tes");
  }
  @override
  void initState() {
    _pageC = PageController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageC.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("custom built");

    return Container(
      height: widget.height,
      width: widget.width,
      color: widget.bgColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onLongPress: () => _pageC.animateToPage(0,
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInCubic),
              onTap: () => _pageC.previousPage(
                  duration: const Duration(milliseconds: 120),
                  curve: Curves.easeInCubic),
              child: Image.asset(
                "assets/imgs/icons/back_arrow.png",
                color: secondary_cr,
              )),
          Expanded(
            child: PageView.builder(
              onPageChanged: widget.onPageChanged,
              scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
              controller: _pageC,
              itemCount: widget.children.length,
              itemBuilder: (context, index) => InkWell(
                onTap: widget.onTap,
                onLongPress: widget.onLongPress,
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                child: Align(
                  alignment: Alignment.center,
                  child: widget.children[index],
                ),
              ),
            ),
          ),
          InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onLongPress: () => _pageC.animateToPage(widget.children.length,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInCubic),
            onTap: () => _pageC.nextPage(
                duration: const Duration(milliseconds: 120),
                curve: Curves.easeInCubic),
            child: Image.asset("assets/imgs/icons/forward_arrow.png",
                color: secondary_cr),
          ),
        ],
      ),
    );
  }
}
