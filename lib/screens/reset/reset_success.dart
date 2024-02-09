import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetSuccess extends StatelessWidget {
  const ResetSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_cr,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/imgs/success.svg",
                width: getWidth(25),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Password Changed!",
                style: body_1.copyWith(color: primary_cr, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your Password has been changed successfully",
                style: body_1.copyWith(color: text_cr),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  function: () {
                    Navigator.of(context).popUntil(ModalRoute.withName("/login"));
                  },
                  colorButton: primary_cr,
                  heightButton: 48,
                  widthButton: 260,
                  childButton: Text(
                    "Back To Login",
                    style: body_1.copyWith(color: white_cr),
                  )),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
