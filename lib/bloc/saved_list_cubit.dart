import 'package:decorly/models/article_post.dart';
import 'package:decorly/models/furniture_item.dart';
import 'package:decorly/models/saved_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_list_state.dart';

class SavedListCubit extends Cubit<SavedListState> {
  SavedListCubit() : super(SavedListEmpty());

  checkEmpty() {
    DataSavedList data = state.data;
    if (data.furniture.isEmpty &
        data.designer.isEmpty &
        data.design.isEmpty &
        data.article.isEmpty) {
      emit(SavedListEmpty());
    }
  }

  updateSavedFurniture({required Furniture furniture}) async {
    if (state.data.furniture.containsKey(furniture.id)) {
      state.data.furniture.remove(furniture.id);
    } else {
      dynamic jsonData = furniture.toJson();
      jsonData["bookmark"] = true;
      state.data.furniture[furniture.id] = Furniture.fromJson(jsonData);
    }
    emit(SavedListFetched(datas: state.data));
  }

  updateSavedArticle({required Article article}) async {
    if (state.data.article.containsKey(article.id)) {
      state.data.article.remove(article.id);
    } else {
      dynamic jsonData = article.toJson();
      jsonData["bookmark"] = true;
      state.data.article[article.id] = Article.fromJson(jsonData);
    }
    emit(SavedListFetched(datas: state.data));
  }

  updateSavedDesign({required Article design}) async {
    if (state.data.design.containsKey(design.id)) {
      state.data.design.remove(design.id);
    } else {
      dynamic jsonData = design.toJson();
      jsonData["bookmark"] = true;
      state.data.design[design.id] = Article.fromJson(jsonData);
    }
    emit(SavedListFetched(datas: state.data));
  }
}
