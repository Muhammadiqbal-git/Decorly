part of "check_out_cubit.dart";

abstract class CheckOutState {
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final int paymentMethod;
  final String? bank;
  final CreditCard? cc;
  final String? paypal;
  final int progress;
  final int indexProgress;
  CheckOutState(
      {required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      required this.paymentMethod,
      this.bank,
      this.cc,
      this.paypal,
      required this.progress,
      required this.indexProgress});
}

class CheckOutInitial extends CheckOutState {
  CheckOutInitial()
      : super(
            address: "",
            city: "",
            country: "",
            zipCode: "",
            paymentMethod: 0,
            progress: 0,
            indexProgress: 0);
}

class CheckOutProcessing extends CheckOutState {
  CheckOutProcessing({
    required super.address,
    required super.city,
    required super.country,
    required super.zipCode,
    required super.paymentMethod,
    required super.progress,
    required super.indexProgress,
    String? bank,
    CreditCard? cc,
    String? paypal,
  }):super(bank: bank, cc: cc, paypal: paypal);
}
