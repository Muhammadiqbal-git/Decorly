import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomRate extends StatelessWidget {
  final String rateScore;
  const CustomRate({super.key, required this.rateScore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/imgs/icons/star.png",
          color: Colors.yellow.shade700,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "( $rateScore)",
          style: caption_1.copyWith(fontSize: 11, color: subtle_text_cr),
        ),
      ],
    );
  }
}
