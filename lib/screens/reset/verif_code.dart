import 'package:decorly/screens/login_page.dart';
import 'package:decorly/screens/reset/reset_pass.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetCodeVerif extends StatefulWidget {
  const ResetCodeVerif({super.key});

  @override
  State<ResetCodeVerif> createState() => _ResetCodeVerifState();
}

class _ResetCodeVerifState extends State<ResetCodeVerif> {
  late TextEditingController firstText;
  late TextEditingController secondText;
  late TextEditingController thirdText;
  late TextEditingController fourthText;
  late FocusNode firstFocus;
  late FocusNode secondFocus;
  late FocusNode thirdFocus;
  late FocusNode fourthFocus;

  @override
  void initState() {
    firstText = TextEditingController();
    secondText = TextEditingController();
    thirdText = TextEditingController();
    fourthText = TextEditingController();
    firstFocus = FocusNode()
      ..addListener(() {
        firstText.selection = TextSelection(
            baseOffset: 0, extentOffset: firstText.value.text.length);
      });
    secondFocus = FocusNode()
      ..addListener(() {
        secondText.selection = TextSelection(
            baseOffset: 0, extentOffset: secondText.value.text.length);
      });
    thirdFocus = FocusNode()
      ..addListener(() {
        thirdText.selection = TextSelection(
            baseOffset: 0, extentOffset: thirdText.value.text.length);
      });
    fourthFocus = FocusNode()
      ..addListener(() {
        fourthText.selection = TextSelection(
            baseOffset: 0, extentOffset: fourthText.value.text.length);
      });

    super.initState();
  }

  @override
  void dispose() {
    firstText.dispose();
    secondText.dispose();
    thirdText.dispose();
    fourthText.dispose();
    firstFocus.dispose();
    secondFocus.dispose();
    thirdFocus.dispose();
    fourthFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("page code kebuild");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white_cr,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const ImageIcon(
              AssetImage('assets/imgs/back_arrow.png'),
              color: text_cr,
            )),
        title: Text(
          "Verification",
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
                  "assets/imgs/verif.svg",
                  width: getWidth(25),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Enter Verification Code",
                  style: body_1.copyWith(color: text_cr),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary_cr, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        //FIRST TEXTFIELD
                        child: TextField(
                          focusNode: firstFocus,
                          controller: firstText,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration.collapsed(
                            border: InputBorder.none,
                            hintText: "",
                          ),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          onChanged: (value) {
                            print("itcheng");
                            if (value.isNotEmpty) {
                              FocusManager.instance.primaryFocus?.nextFocus();
                            }
                          },
                          onSubmitted: (value) {
                            print("tes");
                            print(value);
                          },
                          style: body_1.copyWith(
                              color: primary_cr,
                              fontSize: 24,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary_cr, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: TextField(
                          focusNode: secondFocus,
                          controller: secondText,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration.collapsed(
                            hintText: "",
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          onChanged: (value) {
                            print(value);
                            if (value.isNotEmpty) {
                              FocusManager.instance.primaryFocus?.nextFocus();
                            }
                          },
                          style:
                              body_1.copyWith(color: primary_cr, fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary_cr, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: TextField(
                          focusNode: thirdFocus,
                          controller: thirdText,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration.collapsed(
                            hintText: "",
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              FocusManager.instance.primaryFocus?.nextFocus();
                            }
                          },
                          style:
                              body_1.copyWith(color: primary_cr, fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary_cr, width: 2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: TextField(
                          focusNode: fourthFocus,
                          controller: fourthText,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration.collapsed(
                            hintText: "",
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                          },
                          style:
                              body_1.copyWith(color: primary_cr, fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    function: () {
                      print("pressed");
                      print(
                          "${firstText.value.text} ${secondText.value.text} ${thirdText.value.text} ${fourthText.value.text}");
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                        builder: (context) => ResetPassword(),
                      ), ModalRoute.withName("/login"),);
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //   builder: (context) => ResetPassword(),
                      // ));
                    },
                    colorButton: primary_cr,
                    heightButton: 48,
                    widthButton: 260,
                    childButton: Text(
                      "Verify",
                      style: body_1.copyWith(color: white_cr),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "If you didn't receive a code! ",
                      style: caption_1.copyWith(color: subtle_text_cr),
                    ),
                    InkWell(
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          print("resend code");
                        },
                        child: Text(
                          "Resend",
                          style: caption_1.copyWith(color: secondary_cr),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
