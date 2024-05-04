import 'package:decorly/models/furniture_item.dart';
import 'package:decorly/models/order_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderEmpty());

  addOrder(Map<String, Furniture> items, Map<String, int> itemsPcs,
      int totalItems, double totalCosts) {
    DateTime now = DateTime.now();
    emit(
      OrderFilled(
        orderList: state.orderList
          ..add(
            OrderItem(
                item: items,
                itemPCS: itemsPcs,
                date: now,
                totalItem: totalItems,
                totalCost: totalCosts),
          ),
      ),
    );
  }
}

abstract class OrderState {
  List<OrderItem> orderList;
  OrderState({required this.orderList});
}

class OrderEmpty extends OrderState {
  OrderEmpty() : super(orderList: []);
}

class OrderFilled extends OrderState {
  OrderFilled({required super.orderList});
}
