import 'package:decorly/bloc/onboarding_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingItem {
  final String title;
  final String desc;
  OnboardingItem({required this.title, required this.desc});
}

class OnBoardingIndicator extends StatelessWidget {
  OnBoardingIndicator({super.key});
  final List<OnboardingItem> onboarding_list = [
    OnboardingItem(
        title: "Unique furniture,",
        desc:
            "make your home speaks with items from a variety of home brands."),
    OnboardingItem(
        title: "View in a room,",
        desc:
            "3d feature allows you efficiently visualize and arrange items within your space."),
    OnboardingItem(
        title: "Design Consultations,",
        desc: "Contact directly to any professional interior designer."),
    OnboardingItem(
        title: "Articles about design,",
        desc:
            "keep up-to-date on the latest news and updates related to decore and design."),
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
              print("pressed");
            }),
            icon: const ImageIcon(AssetImage('assets/imgs/back_arrow.png'))),
        actions: [
          TextButton(
              onPressed: (() {
                print("skip pressed");
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
                    height: getHeight(context, 20),
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
                            Text(onboarding_list[state.value].desc,
                                style: desc.copyWith(color: white_cr))
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: getHeight(context, 3)),
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
                  SizedBox(height: getHeight(context, 6)),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  // BlocListener<OnboardingCubit, OnboardingState>(
                  //   listener: (context, state) {
                  //     print("terjadi perubahan ${_pageController.page}");
                  //     // if (state.value - _pageController.page.value == 1) {

                  //     // } else {

                  //     // }
                  //   },
                  //   child: PageView(
                  //     controller: _pageController,
                  //     children: [
                  //       Image.asset("assets/imgs/onboarding_item1.png"),
                  //       Image.asset("assets/imgs/onboarding_item1.png"),
                  //       Image.asset("assets/imgs/onboarding_item1.png"),
                  //       Image.asset("assets/imgs/onboarding_item1.png"),

                  //     ],
                  //   ),
                  // ),
                  AnimatedPositioned(
                      bottom: getHeight(context, 5),
                      right: -getWidth(context, 40),
                      duration: const Duration(milliseconds: 290),
                      child: Image.asset(
                        "assets/imgs/onboarding_item1.png",
                        width: getWidth(context, 100),
                      )),
                  AnimatedPositioned(
                      bottom: 0,
                      right: -getWidth(context, 15),
                      duration: const Duration(milliseconds: 290),
                      child: Image.asset(
                        "assets/imgs/onboarding_item2.png",
                        width: getWidth(context, 80),
                      )),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: OutlinedButton(
                          onPressed: () {
                            print("Button onboarding pressed !!");
                            BlocProvider.of<OnboardingCubit>(context)
                                .next(_pageController);
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.yellow.shade800,
                              padding: const EdgeInsets.all(0)),
                          child: const Text('>')),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
