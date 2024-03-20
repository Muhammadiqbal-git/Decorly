import 'dart:io';

import 'package:decorly/models/article_post.dart';
import 'package:decorly/models/designer.dart';
import 'package:decorly/models/furniture_item.dart';
import 'package:decorly/models/saved_list.dart';
import 'package:decorly/services/article_api.dart';
import 'package:decorly/services/designer_api.dart';
import 'package:decorly/services/furniture_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_list_state.dart';

class SavedListCubit extends Cubit<SavedListState> {
  SavedListCubit() : super(SavedListEmpty());

  getData() async {
    emit(SavedListLoading());
    DataArticle dataArticle = await ArticleAPI().getData("article");
    DataArticle dataDesign = await ArticleAPI().getData("design");
    DataDesigner dataDesigner = await DesignerAPI().getData();
    DataFurniture dataFurniture = await FurnitureAPI().getData(1);
    print(dataFurniture);
    emit(SavedListFetched(
        data: DataSavedList(
            furniture: dataFurniture.data,
            article: dataArticle.data,
            design: dataDesign.data,
            designer: dataDesigner.data),
        index: 0));
  }

  updateIndex(int indexTab) async {
    dynamic currentState = state;
    if (currentState is SavedListFetched) {
      emit(SavedListFetched(data: currentState.data, index: indexTab));
    }
  }
}
