import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final AssetImage logo;
  final bool isObsecure;
  final TextEditingController textEditingController;
  const CustomForm(
      {super.key,
      required this.logo,
      required this.isObsecure,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.grey,
      child: Row(
        children: [
          SizedBox(width: 15,),
          ImageIcon(logo, color: primary_cr,),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(),
            ),
          )
        ],
      ),
    );
  }
}
