import 'package:decorly/screens/reset/reset_success.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController _newPassTextController;
  late TextEditingController _confirmPassTextController;

  @override
  void initState() {
    _newPassTextController = TextEditingController();
    _confirmPassTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _newPassTextController.dispose();
    _confirmPassTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: white_cr,
        title: Text("New Password", style: body_1.copyWith(color: text_cr)),
        centerTitle: true,
      ),
      backgroundColor: white_cr,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(children: [
              const SizedBox(
                height: 25,
              ),
              SvgPicture.asset(
                "assets/imgs/key.svg",
                width: getWidth(24),
              ),
              const SizedBox(
                height: 60,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Your New Password",
                    style: body_1.copyWith(color: text_cr),
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomForm(
                logo: const AssetImage("assets/imgs/icons/lock.png"),
                textEditingController: _newPassTextController,
                textInputAction: TextInputAction.next,
                hintText: "New password",
                isObsecure: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomForm(
                logo: const AssetImage("assets/imgs/icons/lock.png"),
                textEditingController: _confirmPassTextController,
                textInputAction: TextInputAction.done,
                hintText: "Confirm password",
                isObsecure: true,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  function: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => ResetSuccess(),
                        ),
                        ModalRoute.withName("/login"));
                  },
                  colorButton: primary_cr,
                  heightButton: 48,
                  widthButton: 260,
                  childButton: Text(
                    "Submit",
                    style: body_1.copyWith(color: white_cr),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
