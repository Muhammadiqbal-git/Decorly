import 'package:decorly/models/saved_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_list_state.dart';
class SavedListCubit extends Cubit<SavedListState> {
  SavedListCubit() : super(SavedListEmpty());
}