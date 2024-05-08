import 'package:decorly/bloc/article_post_cubit.dart';
import 'package:decorly/bloc/design_post_cubit.dart';
import 'package:decorly/bloc/designer_cubit.dart';
import 'package:decorly/bloc/featured_item_cubit.dart';
import 'package:decorly/bloc/login_page_cubit.dart';
import 'package:decorly/bloc/term_cubit.dart';
import 'package:decorly/screens/main_page.dart';
import 'package:decorly/screens/reset_verif_email.dart';
import 'package:decorly/screens/term_page.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailTextController;
  late TextEditingController _passTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _registPassTextController;
  late PageController _pageController;
  late bool check;
  late bool term;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _registPassTextController = TextEditingController();
    _pageController = PageController();
    check = false;
    term = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _nameTextController.dispose();
    _phoneTextController.dispose();
    _registPassTextController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_cr,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: getHeight(8),
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
                    InkWell(
                        overlayColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          BlocProvider.of<LoginPageCubit>(context)
                              .changeState(false);
                          // _pageController.previousPage(
                          //     duration: Duration(milliseconds: 300),
                          //     curve: Curves.linear);
                        },
                        child: Text("Sign In",
                            style: body_1.copyWith(color: primary_cr))),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<LoginPageCubit, LoginPageState>(
                      builder: (context, state) {
                        return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 5,
                            width: 63,
                            decoration: BoxDecoration(
                                color: state.nextPage
                                    ? Colors.transparent
                                    : primary_cr,
                                borderRadius: BorderRadius.circular(6)));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 77,
                ),
                Column(
                  children: [
                    InkWell(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        BlocProvider.of<LoginPageCubit>(context)
                            .changeState(true);
                        // _pageController.nextPage(
                        //     duration: Duration(milliseconds: 300),
                        //     curve: Curves.linear);
                      },
                      child: Text(
                        "Sign Up",
                        style: body_1.copyWith(color: primary_cr),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<LoginPageCubit, LoginPageState>(
                      builder: (context, state) {
                        return AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 5,
                            width: 63,
                            decoration: BoxDecoration(
                                color: state.nextPage
                                    ? primary_cr
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6)));
                      },
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: BlocListener<LoginPageCubit, LoginPageState>(
                listener: (context, state) {
                  if (state.nextPage) {
                    _pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic);
                  } else {
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic);
                  }
                },
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    if (value == 1) {
                      BlocProvider.of<LoginPageCubit>(context)
                          .changeState(true);
                      BlocProvider.of<TermCubit>(context).changeState(false);
                    } else {
                      BlocProvider.of<LoginPageCubit>(context)
                          .changeState(false);
                    }
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back \nYou've been missed!",
                            style: body_1.copyWith(color: text_cr),
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
                                    style: body_1.copyWith(
                                        fontSize: 15, color: text_cr),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  CustomForm(
                                    logo:
                                        const AssetImage("assets/imgs/icons/msg.png"),
                                    textEditingController: _emailTextController,
                                    textInputAction: TextInputAction.next,
                                    hintText: "Enter your email",
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "Password",
                                    style: body_1.copyWith(
                                        fontSize: 15, color: text_cr),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  CustomForm(
                                    logo: const AssetImage(
                                        "assets/imgs/icons/lock.png"),
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
                                          overlayColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
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
                                            fontSize: 11,
                                            color: subtle_text_cr),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        overlayColor:
                                            const MaterialStatePropertyAll(
                                                Colors.transparent),
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            // maintainState: false,
                                            builder: (context) =>
                                                const ResetEmailVerif(),
                                          ));
                                        },
                                        child: Text(
                                          "Forgot password?",
                                          style: caption_1.copyWith(
                                              color: text_cr),
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
                                        BlocProvider.of<FeaturedItemCubit>(context).getData(1, 0);
                                        BlocProvider.of<DesignCubit>(context).getData();
                                        BlocProvider.of<ArticleCubit>(context).getData();
                                        BlocProvider.of<DesignerCubit>(context).getData();
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) => const MainPage(),
                                        ));
                                      },
                                      colorButton: primary_cr,
                                      widthButton: 260,
                                      heightButton: 48,
                                      childButton: Text(
                                        "Sign In",
                                        style: body_1.copyWith(color: accent_cr),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10 + getHeight(2),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "You Don't Have An Account? ",
                                        style: caption_1.copyWith(
                                            color: subtle_text_cr),
                                      ),
                                      InkWell(
                                        overlayColor:
                                            const MaterialStatePropertyAll(
                                                Colors.transparent),
                                        splashFactory: NoSplash.splashFactory,
                                        onTap: () {
                                          BlocProvider.of<LoginPageCubit>(
                                                  context)
                                              .changeState(true);
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
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
                              style:
                                  body_1.copyWith(fontSize: 15, color: text_cr),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomForm(
                              logo: const AssetImage("assets/imgs/icons/profile.png"),
                              textEditingController: _nameTextController,
                              textInputAction: TextInputAction.next,
                              hintText: "eg: Muhammad Iqbal",
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Email",
                              style:
                                  body_1.copyWith(fontSize: 15, color: text_cr),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomForm(
                              logo: const AssetImage("assets/imgs/icons/msg.png"),
                              textEditingController: _emailTextController,
                              textInputAction: TextInputAction.next,
                              hintText: "youremail@gmail.com",
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Mobile Number",
                              style:
                                  body_1.copyWith(fontSize: 15, color: text_cr),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomForm(
                              logo: const AssetImage("assets/imgs/icons/phone.png"),
                              textEditingController: _phoneTextController,
                              textInputAction: TextInputAction.next,
                              hintText: "Enter your Phone Number",
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Password",
                              style:
                                  body_1.copyWith(fontSize: 15, color: text_cr),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomForm(
                              logo: const AssetImage("assets/imgs/icons/lock.png"),
                              textEditingController: _registPassTextController,
                              textInputAction: TextInputAction.done,
                              hintText: "Enter your Password",
                              isObsecure: true,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 1,
                                ),
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: BlocBuilder<TermCubit, TermState>(
                                    builder: (context, state) {
                                      return Checkbox(
                                          overlayColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          value: state.value,
                                          onChanged: null);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "By creating an account, you agree our ",
                                      style: caption_1.copyWith(
                                          fontSize: 11, color: subtle_text_cr),
                                    ),
                                    InkWell(
                                      overlayColor:
                                          const MaterialStatePropertyAll(
                                              Colors.transparent),
                                      splashFactory: NoSplash.splashFactory,
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const TermsPage(),
                                        ));
                                      },
                                      child: Text(
                                        "Terms and Conditions",
                                        style: body_1.copyWith(
                                            fontSize: 11,
                                            color: subtle_text_cr),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton(
                                  function: () {
                                  },
                                  colorButton: primary_cr,
                                  heightButton: 48,
                                  widthButton: 260,
                                  childButton: Text(
                                    "Sign Up",
                                    style: body_1.copyWith(color: accent_cr),
                                  )),
                            ),
                            SizedBox(
                              height: 10 + getHeight(2),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
