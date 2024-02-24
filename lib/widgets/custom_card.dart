import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double heightContainer;
  final double widthContainer;
  final Color backgroundColor;
  final Widget widget;
  final EdgeInsets marginContainer;
  const CustomCard(
      {super.key,
      required this.heightContainer,
      required this.widthContainer,
      required this.backgroundColor,
      required this.widget,
      this.marginContainer =const EdgeInsets.all(0) 
      });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 10),
      height: heightContainer,
      width: widthContainer,
      margin: marginContainer,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: widget,
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
