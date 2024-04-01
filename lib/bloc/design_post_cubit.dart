import 'package:decorly/models/article_post.dart';
import 'package:decorly/services/article_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'design_post_state.dart';

class DesignCubit extends Cubit<DesignState> {
  DesignCubit() : super(DesignLoading());

  getData() async {
    emit(DesignLoading());
    DataArticle dataArticle = await ArticleAPI().getData("design");
    Future.delayed(Duration(milliseconds: 500));
    emit(DesignFetched(currentIndex: 0, dataArticle: dataArticle));
  }

  updateData(String id) {
    final DesignState currentState = state;
    if (currentState is DesignFetched) {
      dynamic jsonData = currentState.dataArticle.toJson();
      List newData = jsonData["data"];
      int index = newData.indexWhere((element) => element.containsValue(id));
      jsonData["data"][index]["bookmark"] =
          !jsonData["data"][index]["bookmark"];
      DataArticle data = DataArticle.fromJson(jsonData);
      emit(DesignFetched(
          currentIndex: currentState.currentIndex, dataArticle: data));
    }
  }

  updateIndexData(int index) {
    dynamic currentState = state;
    if (currentState is DesignFetched) {
      emit(DesignFetched(
          currentIndex: index, dataArticle: currentState.dataArticle));
    }
  }
}
