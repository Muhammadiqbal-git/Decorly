import 'package:decorly/models/article_post.dart';
import 'package:decorly/services/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'article_post_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleLoading());

  getData() async{
    emit(ArticleLoading());
    DataArticle dataArticle = await ArticleAPI().getData("articles");
    emit(ArticleFetched(currentIndex: 0, data: dataArticle.data));
  }

  updateIndexData(int index){
    var currentState = state;
    if (currentState is ArticleFetched) {
      emit(ArticleFetched(currentIndex: index, data: currentState.data));
    }
  }
}
