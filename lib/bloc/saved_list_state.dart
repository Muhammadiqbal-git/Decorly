part of "saved_list_cubit.dart";

abstract class SavedListState{
}

class SavedListEmpty extends SavedListState{
}
class SavedListLoading extends SavedListState{
}

class SavedListFetched extends SavedListState{
  DataSavedList data;
  int index;
  SavedListFetched({required this.data, required this.index});
}