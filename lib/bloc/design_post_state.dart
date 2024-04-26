part of "design_post_cubit.dart";
abstract class DesignState{}

class DesignFetched extends DesignState{
final int currentIndex;
final DataArticle dataArticle;

  DesignFetched({required this.currentIndex, required this.dataArticle});
}
class DesignLoading extends DesignState{}