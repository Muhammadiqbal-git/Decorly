part of "cart_cubit.dart";

abstract class CartState {
  final Map<String, Furniture> itemCart;
  final Map<String, int> itemPcs;
  final int? totalItem;
  final double? deliveryCost;
  final double? totalCost;
  CartState({
    required this.itemCart,
    required this.itemPcs,
    this.totalItem,
    this.deliveryCost,
    this.totalCost,
  });
}

class CartEmpty extends CartState {
  CartEmpty()
      : super(
          itemCart: {},
          itemPcs: {},
          totalItem: 0,
          deliveryCost: 0,
          totalCost: 0,
        );
}

class CartFilled extends CartState {
  CartFilled({
    required super.itemCart,
    required super.itemPcs,
    int? totalItem,
    double? deliveryC,
    double? totalC,
  }) : super(
          totalItem: totalItem,
          deliveryCost: deliveryC,
          totalCost: totalC,
        );
}
