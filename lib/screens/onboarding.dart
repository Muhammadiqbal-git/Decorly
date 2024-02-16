import 'package:decorly/bloc/onboarding_cubit.dart';
import 'package:decorly/models/onboarding_item.dart';
import 'package:decorly/screens/login_page.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingIndicator extends StatelessWidget {
  OnBoardingIndicator({super.key});
  final List<OnboardingItem> onboarding_list = [
    OnboardingItem(
        title: "Unique furniture,",
        desc: "make your home speaks with items from a variety of home brands.",
        position: [-25, 60, 160, 160]),
    OnboardingItem(
        title: "View in a room,",
        desc:
            "3d feature allows you efficiently visualize and arrange items within your space.",
        position: [-100, -15, 95, 115]),
    OnboardingItem(
        title: "Design Consultations,",
        desc: "Contact directly to any professional interior designer.",
        position: [
          [120, -100],
          [120, -100],
          [13, 13],
          [-100, 120]
        ]),
    OnboardingItem(
        title: "Articles about design,",
        desc:
            "keep up-to-date on the latest news and updates related to decore and design.",
        position: [
          [120, -100],
          [120, -100],
          [120, -100],
          [10, 10]
        ]),
  ];
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_cr,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary_cr,
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: (() {
              BlocProvider.of<OnboardingCubit>(context)
                  .previous(_pageController);
            }),
            icon: const ImageIcon(AssetImage('assets/imgs/back_arrow.png'))),
        actions: [
          TextButton(
              onPressed: (() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              }),
              style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              child: Text("Skip", style: body_2.copyWith(color: white_cr)))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130,
                    child: BlocBuilder<OnboardingCubit, OnboardingState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(onboarding_list[state.value].title,
                                style: display.copyWith(color: white_cr)),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              onboarding_list[state.value].desc,
                              style: desc.copyWith(color: white_cr),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: getHeight(6),
                  ),
                  BlocBuilder<OnboardingCubit, OnboardingState>(
                    builder: (context, state) {
                      print('State number ${state.value}');
                      return Row(
                        children: List.generate(
                          4,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 10,
                            width: index == state.value ? 22 : 12,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                color: white_cr,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: getHeight(3)),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      AnimatedPositioned(
                          curve: Curves.easeInOut,
                          bottom: getHeight( 5),
                          right: getWidth(
                              onboarding_list[0].position[state.value]),
                          duration: const Duration(milliseconds: 290),
                          child: Image.asset(
                            "assets/imgs/onboarding_item1.png",
                            width: getWidth( 100),
                          )),
                      AnimatedPositioned(
                          curve: Curves.easeInOut,
                          bottom: 0,
                          right: getWidth(
                              onboarding_list[1].position[state.value]),
                          duration: const Duration(milliseconds: 290),
                          child: Image.asset(
                            "assets/imgs/onboarding_item2.png",
                            width: getWidth( 90),
                          )),
                      AnimatedPositioned(
                          curve: Curves.easeInOut,
                          bottom: 0,
                          left: getWidth(
                              onboarding_list[2].position[state.value][0]),
                          right: getWidth(
                              onboarding_list[2].position[state.value][1]),
                          duration: const Duration(milliseconds: 310),
                          child: Image.asset(
                            "assets/imgs/onboarding_item3.png",
                            width: getWidth( 100),
                          )),
                      AnimatedPositioned(
                          curve: Curves.easeInOut,
                          bottom: 0,
                          left: getWidth(
                              onboarding_list[3].position[state.value][0]),
                          right: getWidth(
                              onboarding_list[3].position[state.value][1]),
                          duration: const Duration(milliseconds: 310),
                          child: Image.asset(
                            "assets/imgs/onboarding_item4.png",
                            width: getWidth( 80),
                          )),
                      Positioned(
                        top: getHeight( 5),
                        right: 0,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child:
                                BlocBuilder<OnboardingCubit, OnboardingState>(
                              builder: (context, state) {
                                if (state.value == 3) {
                                  return CustomButton(
                                      function: () {
                                        Navigator.of(context)
                                            .pushReplacementNamed("/login");
                                      },
                                      colorButton: white_cr,
                                      heightButton: 48,
                                      widthButton: 128,
                                      opacityButton: 0.90,
                                      childButton: Text(
                                        "Get Started",
                                        style:
                                            body_1.copyWith(color: primary_cr),
                                      ));
                                } else {}
                                return CustomButton(
                                    function: () {
                                      BlocProvider.of<OnboardingCubit>(context)
                                          .next(_pageController);
                                    },
                                    colorButton: white_cr,
                                    widthButton: 48,
                                    heightButton: 48,
                                    opacityButton: 0.86,
                                    childButton: const ImageIcon(
                                        AssetImage(
                                            "assets/imgs/forward_arrow.png"),
                                        color: primary_cr));
                              },
                            )),
                      ),
                      SizedBox.expand(
                        child: GestureDetector(
                          onHorizontalDragEnd: (details) {
                            int sens = 50;
                            if (details.primaryVelocity! > sens) {
                              BlocProvider.of<OnboardingCubit>(context)
                                  .previous(_pageController);
                            } else if (details.primaryVelocity! < -sens) {
                              BlocProvider.of<OnboardingCubit>(context)
                                  .next(_pageController);
                            }
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
