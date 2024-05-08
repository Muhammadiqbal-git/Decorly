import 'package:decorly/screens/reset_verif_code.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetEmailVerif extends StatefulWidget {
  const ResetEmailVerif({super.key});

  @override
  State<ResetEmailVerif> createState() => _ResetEmailVerifState();
}

class _ResetEmailVerifState extends State<ResetEmailVerif> {
  late TextEditingController _emailTextController;
  @override
  void initState() {
    _emailTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white_cr,
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const ImageIcon(
              AssetImage('assets/imgs/icons/back_arrow.png'),
              color: text_cr,
            )),
        title: Text(
          "Reset Password",
          style: body_1.copyWith(color: text_cr),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                SvgPicture.asset(
                  "assets/imgs/email.svg",
                  width: getWidth(26),
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Email Address",
                      style: body_1.copyWith(color: text_cr),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "A verification code will be sent to you email to reset password",
                      style: body_1.copyWith(fontSize: 13, color: text_cr),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomForm(
                  logo: const AssetImage("assets/imgs/icons/msg.png"),
                  textEditingController: _emailTextController,
                  textInputAction: TextInputAction.done,
                  hintText: "Enter your Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                  child: Text(
                    "Back to Sign In",
                    style: caption_1.copyWith(color: subtle_text_cr),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    function: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ResetCodeVerif(),
                      ));
                    },
                    colorButton: primary_cr,
                    heightButton: 48,
                    widthButton: 260,
                    childButton: Text(
                      "Send Code",
                      style: body_1.copyWith(color: accent_cr),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
