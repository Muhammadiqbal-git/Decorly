import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState(index: 0));

  updateIndex(int index){
    emit(MainPageState(index: index));
  }
}

class MainPageState{
  int index;
  MainPageState({required this.index});
}