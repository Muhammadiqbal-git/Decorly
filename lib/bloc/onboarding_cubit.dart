import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(value: 0));

  void next() {
    if (state.value < 3) {
      emit(OnboardingState(value: state.value + 1));
    }
  }

  void previous() {
    if (state.value > 0) {
      emit(OnboardingState(value: state.value - 1));
    }
  }
}
