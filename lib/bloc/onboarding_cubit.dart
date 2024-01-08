import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(value: 0));

  void next(){
    print('Next fn pressed'); 
    emit(OnboardingState(value: state.value+1));
  }
  void previous(){
    emit(OnboardingState(value: state.value-1));
  }
}