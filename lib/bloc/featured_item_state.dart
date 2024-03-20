part of "featured_item_cubit.dart";
abstract class FeaturedItemState{}

class FeaturedItemFetched extends FeaturedItemState{
  final int bottomIndex;
  final DataFurniture dataFurniture;
  final List<double> bottomPosition;
  final List<List<double>> paddingCard;
  final List colorCard;
  final List colorText;
  FeaturedItemFetched({required this.bottomIndex, required this.dataFurniture, required this.bottomPosition, required this.paddingCard, required this.colorCard, required this.colorText});
}

class FeaturedItemLoading extends FeaturedItemState{}

class FeaturedItemEmpty extends FeaturedItemState{}

class FeaturedItemInitial extends FeaturedItemState{
  final DataFurniture data;
  FeaturedItemInitial({required this.data});
}
