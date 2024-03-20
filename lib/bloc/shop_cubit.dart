import 'package:decorly/models/furniture_item.dart';
import 'package:decorly/services/furniture_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopLoading());
  getData(List<String> filter) async {
    emit(ShopLoading());
    DataFurniture dataFurniture = await FurnitureAPI().getAllData(filter);
    emit(ShopFetched(data: dataFurniture.data, filter: filter));
  }
}

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterEmpty([], [], []));
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
    await Future.delayed(Duration(milliseconds: 400));
    emit(FilterDone(state.filters, state.recentFilters..add(filter),
        state.activeFilter..add(filter)));
  }
  removeFilter(String filter) {
    emit(FilterDone(state.filters, state.recentFilters, state.activeFilter..remove(filter)));
  }

  searchFilter(String filter) async {
    emit(FilterLoading(state.filters, state.recentFilters, state.activeFilter));
    await Future.delayed(Duration(milliseconds: 400));
    if (filter.isEmpty) {
      List<String> recentTempFilter = [];
      if(state.recentFilters.isNotEmpty){
        for (var i = 0; i < state.filters.length; i++) {
          if (i >= 5) break;
          recentTempFilter.add(state.recentFilters.reversed.toList()[i]);
        }
      }
      emit(FilterEmpty(state.filters, state.recentFilters, state.activeFilter));
      return;
    }
    emit(FilterDone(
        filterDummy
            .where((element) => element.toLowerCase().contains(filter))
            .toList(),
        state.recentFilters..add(filter),
        state.activeFilter));
  }
}
