part of "saved_list_cubit.dart";

abstract class SavedListState{
  DataSavedList data;
  SavedListState({required this.data});
}

class SavedListEmpty extends SavedListState{
  SavedListEmpty() : super(data: DataSavedList(furniture: {}, article: {}, design: {}, designer: {}));
}
class SavedListLoading extends SavedListState{
  SavedListLoading(DataSavedList datas) : super(data: datas);
}

class SavedListFetched extends SavedListState{
  SavedListFetched({required DataSavedList datas}): super(data: datas);
}