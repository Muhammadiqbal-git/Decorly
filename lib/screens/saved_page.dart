import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  AppBar appBar(BuildContext? context) {
    print("saved appbar built");
    return AppBar(
      backgroundColor: white_cr,
      centerTitle: true,
      elevation: 0,
      title: Text(
        "My Saved List",
        style: body_1.copyWith(color: text_cr),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("saved built");
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/imgs/empty.svg",
            width: getWidth(40),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "Your Saved List is Empty!",
            style: body_1.copyWith(fontSize: 20, color: primary_cr),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Explor Products, Interior Designers, Decor Stylesand Articles , save them to show them heres.",
            style: body_2.copyWith(color: text_cr),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              function: () {},
              colorButton: primary_cr,
              widthButton: getWidth(70),
              heightButton: 48,
              childButton: Text(
                "Discover Now & Save",
                style: body_1.copyWith(color: white_cr),
              ))
        ],
      ),
    );
  }
}
