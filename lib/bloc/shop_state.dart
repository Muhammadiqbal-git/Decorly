part of 'shop_cubit.dart';

abstract class ShopState {}

class ShopLoading extends ShopState {}

class ShopFetched extends ShopState {
  final List<Furniture> data;
  final List<String> filter;

  ShopFetched({required this.data, required this.filter});
}

abstract class FilterState {
  final List<String> filters;
  final List<String> recentFilters;
  final List<String> activeFilter;
  FilterState(this.filters, this.recentFilters, this.activeFilter);
}

class FilterLoading extends FilterState {
  FilterLoading(super.filters, super.recentFilters, super.activeFilter);
}

class FilterSearch extends FilterState {
  FilterSearch(List<String> filters, List<String> recentFilters, List<String> activeFilter)
      : super(filters, recentFilters, activeFilter);
}
class FilterInitial extends FilterState {
  FilterInitial(List<String> filters, List<String> recentFilters, List<String> activeFilter)
      : super(filters, recentFilters, activeFilter);
}
