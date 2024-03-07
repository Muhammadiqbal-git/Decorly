import 'package:decorly/models/article_post.dart';
import 'package:decorly/services/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'design_post_state.dart';

class DesignCubit extends Cubit<DesignState> {
  DesignCubit() : super(DesignLoading());

  getData() async {
    emit(DesignLoading());
    DataArticle dataArticle = await ArticleAPI().getData("design");
    Future.delayed(Duration(milliseconds: 500));
    emit(DesignFetched(currentIndex: 0, data: dataArticle.data));
  }

  updateIndexData(int index) {
    dynamic currentState = state;
    if (currentState is DesignFetched) {
      emit(DesignFetched(currentIndex: index, data: currentState.data));
    }
  }
}
