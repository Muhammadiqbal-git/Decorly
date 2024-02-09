import 'package:flutter_bloc/flutter_bloc.dart';

part 'term_state.dart';

class TermCubit extends Cubit<TermState> {
  TermCubit() : super(const TermState(value: false));

  void changeState(bool val) {
    emit(TermState(value: val));
  }
}
