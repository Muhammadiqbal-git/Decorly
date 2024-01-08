import 'package:decorly/bloc/onboarding_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_cr,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green.shade400,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getHeight(context, 20),
                color: Colors.green.shade300,
                child: Column(
                  children: [
                    Text('Title', style: display.copyWith(color: white_cr)),
                    Text('Desc', style: desc.copyWith(color: white_cr))
                  ],
                ),
              ),
              SizedBox(height: getHeight(context, 3)),
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  print('State number ' + state.value.toString());
                  return Row(
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: index == state.value ? 22:12,
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: getHeight(context, 6)),
              Expanded(
                child: Container(
                  color: Colors.green.shade600,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
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
                                    .next();
                              },
                              child: Text('>'),
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.yellow.shade800,
                                  padding: EdgeInsets.all(0))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
