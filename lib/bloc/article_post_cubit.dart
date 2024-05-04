import 'package:decorly/models/article_post.dart';
import 'package:decorly/services/article_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'article_post_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleLoading());

  getData() async {
    emit(ArticleLoading());
    DataArticle dataArticle = await ArticleAPI().getData("articles");
    emit(ArticleFetched(currentIndex: 0, dataArticle: dataArticle));
  }

  updateData(String id) {
    final ArticleState currentState = state;
    if (currentState is ArticleFetched) {
      dynamic jsonData = currentState.dataArticle.toJson();
      List newData = jsonData["data"];
      int index =
          newData.indexWhere((element) => element.containsValue(id));
      jsonData["data"][index]["bookmark"] =
          !jsonData["data"][index]["bookmark"];
      DataArticle data = DataArticle.fromJson(jsonData);
      emit(ArticleFetched(
          currentIndex: currentState.currentIndex, dataArticle: data));
    }
  }

  updateIndexData(int index) {
    var currentState = state;
    if (currentState is ArticleFetched) {
      emit(ArticleFetched(
          currentIndex: index, dataArticle: currentState.dataArticle));
    }
  }
}
