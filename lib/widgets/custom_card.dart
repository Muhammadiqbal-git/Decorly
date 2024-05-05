import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? heightContainer;
  final double? widthContainer;
  final Color backgroundColor;
  final Widget child;
  final EdgeInsets marginContainer;
  final EdgeInsets paddingContainer;
  final AlignmentGeometry? align;

  /// A Card without a border
  const CustomCard(
      {super.key,
      required this.heightContainer,
      required this.widthContainer,
      required this.backgroundColor,
      required this.child,
      this.paddingContainer = const EdgeInsets.fromLTRB(16, 15, 16, 10),
      this.marginContainer = const EdgeInsets.all(0),
      this.align
      });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: paddingContainer,
      width: widthContainer,
      height: heightContainer,
      margin: marginContainer,
      alignment: align,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

// LayoutBuilder(
//         builder: (context, constraints) {
//           return Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 top: 0,
//                 child: Image(
//                   image: img,
//                   height: constraints.maxHeight - 60,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Positioned(
//                   left: 0,
//                   bottom: 0,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: widget,
//                   )),
//               Positioned(
//                   right: 0,
//                   top: 0,
//                   child: InkWell(
//                     onTap: () {
//                       print("ss");
//                     },
//                     child: ImageIcon(
//                       AssetImage("assets/imgs/bookmark.png"),
//                       color: componentColor,
//                     ),
//                   )),
//               Positioned(
//                   right: 0,
//                   bottom: 0,
//                   child: InkWell(
//                     onTap: () {
//                       print("ss");
//                     },
//                     child: ImageIcon(
//                       AssetImage("assets/imgs/cart.png"),
//                       color: componentColor,
//                     ),
//                   )),
//             ],
//           );
//         },
//       ),
