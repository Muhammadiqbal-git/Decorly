import 'dart:io';

import 'package:decorly/models/featured_item.dart';
import 'package:decorly/services/furniture.dart';
import 'package:decorly/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "featured_item_state.dart";

class FeaturedItemCubit extends Cubit<FeaturedItemState> {
  FeaturedItemCubit() : super(FeaturedItemLoading());

  /// The api should work by returning 3 top featured item. so if it takes [indexTop3] as 1, it mean the first top 3 featured item.
  ///
  /// To simulate the API works, it only have 1-2 [indexTop3]
  /// meaning it only have 6 data
  getData(int indexTop3, int bottomIndex) async {
    DataFurniture dataFurniture = await FurnitureAPI().getData(indexTop3);
    print(dataFurniture.data.length);
    emit(FeaturedItemLoading());
    await Future.delayed(const Duration(seconds: 1));
    print("1sec");
    emit(FeaturedItemFetched(
        bottomIndex: bottomIndex,
        data: dataFurniture.data,
        bottomPosition: [
          0,
          20,
          40
        ],
        paddingCard: [
          [0.14, 0.14],
          [0.16, 0.16],
          [0.18, 0.18]
        ],
        colorCard: [
          accent_cr,
          primary_cr
        ],
        colorText: [
          primary_cr,
          secondary_cr
        ]));
  }

  swipeData(int bottomIndex, bool swipeRight) async {
    final currentState = state;
    List<List<double>> paddingData = [];
    List<double> bottomData = [];
    if (currentState is FeaturedItemFetched) {
      paddingData = currentState.paddingCard;
      bottomData = currentState.bottomPosition;
      if (bottomIndex + 1 >= currentState.data.length) {
        print("maxx");
        if (swipeRight) {
          paddingData[bottomIndex] = [1.0, -1.0];
        } else {
          paddingData[bottomIndex] = [-1.0, 1.0];
        }
        emit(FeaturedItemFetched(
            bottomIndex: bottomIndex + 1,
            data: currentState.data,
            bottomPosition: bottomData,
            paddingCard: paddingData,
            colorCard: currentState.colorCard,
            colorText: currentState.colorText));
        await Future.delayed(Duration(milliseconds: 300));
        emit(FeaturedItemEmpty());
        print("asd");
        return null;
      }

      if (swipeRight) {
        paddingData[bottomIndex] = [1.0, -1.0];
      } else {
        paddingData[bottomIndex] = [-1.0, 1.0];
      }
      print("asdasda");
      for (var i = bottomIndex + 1; i < currentState.data.length; i++) {
        paddingData[i][0] -= 0.02;
        paddingData[i][1] -= 0.02;
        bottomData[i] -= 20;
      }
      print(paddingData);
      emit(FeaturedItemFetched(
          bottomIndex: bottomIndex + 1,
          data: currentState.data,
          bottomPosition: bottomData,
          paddingCard: paddingData,
          colorCard: currentState.colorCard,
          colorText: currentState.colorText));
    }
  }
}
