import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState(nextPage: false));

  void changeState(bool value){
    emit(LoginPageState(nextPage: value));
  }
}