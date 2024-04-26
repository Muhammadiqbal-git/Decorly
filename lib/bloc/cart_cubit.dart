import 'package:decorly/models/furniture_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartEmpty());

  int countTotalItem(Map<String, int> itemPcs) {
    if (itemPcs.values.isEmpty) {
      return 0;
    }
    return itemPcs.values.reduce((value, element) => value + element);
  }

  double countTotalCost(Map<String, Furniture> item, Map<String, int> itemPcs) {
    double totalCost = 0;
    item.forEach((key, value) {
      totalCost += itemPcs[key]! * value.price;
    });
    return totalCost;
  }

  increaseItem(Furniture furniture) {
    state.itemPcs.update(
      furniture.id,
      (value) => value + 1,
      ifAbsent: () {
        state.itemCart[furniture.id] = furniture;
        return 1;
      },
    );
    emit(CartFilled(
        itemCart: state.itemCart,
        itemPcs: state.itemPcs,
        totalItem: countTotalItem(state.itemPcs),
        deliveryC: 59,
        totalC: countTotalCost(state.itemCart, state.itemPcs),
));
    if (state.itemCart.isEmpty) {
      emit(CartEmpty());
    }
  }

  decreaseItem(Furniture furniture) {
    state.itemPcs.update(furniture.id, (value) => value - 1);
    if (state.itemPcs[furniture.id]! <= 0) {
      state.itemCart.remove(furniture.id);
      state.itemPcs.remove(furniture.id);
    }
    emit(CartFilled(
        itemCart: state.itemCart,
        itemPcs: state.itemPcs,
        totalItem: countTotalItem(state.itemPcs),
        deliveryC: 59,
        totalC: countTotalCost(state.itemCart, state.itemPcs),
));
    if (state.itemCart.isEmpty) {
      emit(CartEmpty());
    }
  }

}
