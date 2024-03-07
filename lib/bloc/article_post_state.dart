part of "article_post_cubit.dart";
abstract class ArticleState{}

class ArticleFetched extends ArticleState{
final int currentIndex;
final List<Article> data;

  ArticleFetched({required this.currentIndex, required this.data});
}
class ArticleLoading extends ArticleState{}