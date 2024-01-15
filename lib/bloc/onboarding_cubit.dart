import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(value: 0));

  void next(PageController pageController) {
    print('Next fn pressed');
    if (state.value < 3) {
      emit(OnboardingState(value: state.value + 1));
      // pageController.animateToPage(state.value, duration: const Duration(milliseconds: 280), curve: Curves.linear);
    }
  }

  void previous(PageController pageController) {
    if (state.value > 0) {
      emit(OnboardingState(value: state.value - 1));
      // pageController.animateToPage(state.value, duration: const Duration(milliseconds: 280), curve: Curves.linear);

    }
  }
}
