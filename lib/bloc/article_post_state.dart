part of "article_post_cubit.dart";
abstract class ArticleState{}

class ArticleFetched extends ArticleState{
final int currentIndex;
final DataArticle dataArticle;

  ArticleFetched({required this.currentIndex, required this.dataArticle});
}
class ArticleLoading extends ArticleState{}