import 'package:decorly/screens/reset/verif_email.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailTextController;
  late TextEditingController _passTextController;
  late bool check;
  @override
  void initState() {
    print("awal page");
    _emailTextController = TextEditingController();
    _passTextController = TextEditingController();
    check = false;
    super.initState();
  }

  @override
  void dispose() {
    print("disposed");
    _emailTextController.dispose();
    _passTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("page kebuild lg");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: getHeight(6),
              ),
              SvgPicture.asset('assets/imgs/logo.svg'),
              const SizedBox(
                height: 4,
              ),
              Text(
                "DO - Decorly",
                style: apps_name.copyWith(color: primary_cr, fontSize: 18),
              ),
              SizedBox(
                height: 25 + getHeight(1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Sign In",
                          style: body_1.copyWith(color: primary_cr)),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 5,
                          width: 63,
                          decoration: BoxDecoration(
                              color: primary_cr,
                              borderRadius: BorderRadius.circular(6))),
                    ],
                  ),
                  const SizedBox(
                    width: 77,
                  ),
                  Column(
                    children: [
                      Text(
                        "Sign Out",
                        style: body_1.copyWith(color: primary_cr),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 5,
                          width: 63,
                          decoration: BoxDecoration(
                              color: primary_cr,
                              borderRadius: BorderRadius.circular(6))),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back \nYou've been missed!",
                  style: body_1.copyWith(color: text_cr),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Email",
                        style: body_2,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      CustomForm(
                        logo: const AssetImage("assets/imgs/msg.png"),
                        textEditingController: _emailTextController,
                        textInputAction: TextInputAction.next,
                        hintText: "Enter your email",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Password",
                        style: body_2,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      CustomForm(
                        logo: const AssetImage("assets/imgs/lock.png"),
                        isObsecure: true,
                        textEditingController: _passTextController,
                        textInputAction: TextInputAction.done,
                        hintText: "Enter your password",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 1,
                          ),
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: Checkbox(
                              splashRadius: 20.0,
                              value: check,
                              onChanged: (value) {
                                setState(() {
                                  check = !check;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Remember me!",
                            style: caption_1.copyWith(
                                fontSize: 11, color: subtle_text_cr),
                          ),
                          const Spacer(),
                          InkWell(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              print("forgot pressed");
                              FocusScope.of(context).unfocus();
                              Navigator.of(context).push(MaterialPageRoute(
                                // maintainState: false,
                                builder: (context) => const ResetEmailVerif(),
                              ));
                            },
                            child: Text(
                              "Forgot password?",
                              style: caption_1.copyWith(color: text_cr),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          function: () {
                            print("sign in pressed");
                          },
                          colorButton: primary_cr,
                          heightButton: 48,
                          widthButton: 260,
                          childButton: Text(
                            "Sign In",
                            style: body_1,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15 + getHeight(2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You Don't Have An Account? ",
                            style: caption_1.copyWith(color: subtle_text_cr),
                          ),
                          InkWell(
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              print("sign up pressed");
                            },
                            child: Text(
                              "Sign Up",
                              style: caption_1.copyWith(
                                  color: primary_cr,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
