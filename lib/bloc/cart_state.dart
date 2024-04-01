part of "cart_cubit.dart";

abstract class CartState {
  final Map<String, Furniture> itemCart;
  final Map<String, int> itemPcs;
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final String paymentMethod;
  final BankInfo? bank;
  final CreditCard? cc;
  final String? paypal;
  final int? totalItem;
  final double? deliveryCost;
  final double? totalCost;
  final int progress;

  CartState(
      {required this.itemCart,
      required this.itemPcs,
      required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      required this.paymentMethod,
      this.bank,
      this.cc,
      this.paypal,
      this.totalItem,
      this.deliveryCost,
      this.totalCost,
      required this.progress});
}

class CartEmpty extends CartState {
  CartEmpty()
      : super(
            itemCart: {},
            itemPcs: {},
            address: "",
            city: "",
            country: "",
            zipCode: "",
            paymentMethod: "",
            totalItem: 0,
            deliveryCost: 0,
            totalCost: 0,
            progress: 0);
}

class CartFilled extends CartState {
  CartFilled(
      {required super.itemCart,
      required super.itemPcs,
      required super.address,
      required super.city,
      required super.country,
      required super.zipCode,
      required super.paymentMethod,
      BankInfo? bankInfo,
      CreditCard? ccInfo,
      String? paypal,
      int? totalItem,
      double? deliveryC,
      double? totalC,
      required super.progress})
      : super(
            bank: bankInfo,
            cc: ccInfo,
            paypal: paypal,
            totalItem: totalItem,
            deliveryCost: deliveryC,
            totalCost: totalC);
}
