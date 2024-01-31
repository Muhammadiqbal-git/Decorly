import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetCodeVerif extends StatefulWidget {
  const ResetCodeVerif({super.key});

  @override
  State<ResetCodeVerif> createState() => _ResetCodeVerifState();
}

class _ResetCodeVerifState extends State<ResetCodeVerif> {
  @override
  Widget build(BuildContext context) {
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
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 260,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    function: () {
                      print("pressed");
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
