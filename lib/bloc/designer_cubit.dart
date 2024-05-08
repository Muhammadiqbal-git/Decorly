import 'package:decorly/models/designer.dart';
import 'package:decorly/services/designer_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'designer_state.dart';
class DesignerCubit extends Cubit<DesignerState> {
  DesignerCubit() : super(DesignerLoading());

  getData() async{
    emit(DesignerLoading());
    DataDesigner dataDesigner = await DesignerAPI().getData();
    Future.delayed(const Duration(milliseconds: 500));
    emit(DesignerFetched(data: dataDesigner));
  }

  updateData(String id) async{
    DesignerState currentState = state;
    if (currentState is DesignerFetched){
      int index = currentState.data.data.indexWhere((element) => element.id == id);
      dynamic jsonData = currentState.data.toJson();
      jsonData["data"][index]["bookmark"] = !jsonData["data"][index]["bookmark"];
      DataDesigner dataDesigner = DataDesigner.fromJson(jsonData);
      emit(DesignerFetched(data: dataDesigner));
    }
  }
}