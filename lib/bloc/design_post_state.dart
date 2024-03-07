part of "design_post_cubit.dart";
abstract class DesignState{}

class DesignFetched extends DesignState{
final int currentIndex;
final List<Article> data;

  DesignFetched({required this.currentIndex, required this.data});
}
class DesignLoading extends DesignState{}