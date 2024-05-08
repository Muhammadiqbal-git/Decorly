import 'package:decorly/models/furniture_item.dart';
import 'package:decorly/services/furniture_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopLoading());
  getData(List<String> filter) async {
    emit(ShopLoading());
    await Future.delayed(const Duration(milliseconds: 400));
    DataFurniture dataFurniture = await FurnitureAPI().getAllData(filter);
    dataFurniture.data.retainWhere((element) => element.name.toLowerCase().contains(filter[0].toLowerCase()));
    emit(ShopFetched(data: dataFurniture.data, filter: filter));
  }
}

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial([], [], []));
  List<String> filterDummy = [
    "Modern",
    "Indoor",
    "Outdoor",
    "Wood",
    "Industrial",
    "Scandanavian",
    "Cozy",
    "Simple"
  ];
  updateFilter(String filter) async {
    emit(FilterLoading(state.filters, state.recentFilters, state.activeFilter));
    await Future.delayed(const Duration(milliseconds: 400));
    List<String> recentTempFilter = [];
    if (state.recentFilters.isNotEmpty) {
      for (var i = 0; i < state.recentFilters.length; i++) {
        if (i >= 5) break;
        recentTempFilter.add(state.recentFilters.toList()[i]);
      }
    }
    emit(FilterSearch(
        state.filters,
        recentTempFilter..insert(0, filter),
        state.activeFilter..insert(0, filter)));
  }

  removeFilter(String filter) {
    emit(FilterInitial(state.filters, state.recentFilters,
        state.activeFilter..remove(filter)));
  }

  searchFilter(String searchFilter) async {
    emit(FilterLoading(state.filters, state.recentFilters, state.activeFilter));
    await Future.delayed(const Duration(milliseconds: 400));
    if (searchFilter.isEmpty) {
      // List<String> recentTempFilter = [];
      // if(state.recentFilters.isNotEmpty){
      //   for (var i = 0; i < state.filters.length; i++) {
      //     if (i >= 5) break;
      //     recentTempFilter.insert(0, state.filters.toList()[i]);
      //   }
      // }
      // state.recentFilters.setRange(0, state.recentFilters.length, recentTempFilter);
      emit(FilterInitial(
          state.filters, state.recentFilters, state.activeFilter));
      return;
    }
    emit(FilterSearch(
        filterDummy
            .where((element) =>
                element.toLowerCase().contains(searchFilter.toLowerCase()))
            .toList(),
        state.recentFilters,
        state.activeFilter));
  }
}
