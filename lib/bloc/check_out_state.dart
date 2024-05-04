part of "check_out_cubit.dart";

abstract class CheckOutState {
  final String name;
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final int paymentMethod;
  final String? banks;
  final CreditCard? cc;
  final String? paypal;
  final int progress;
  final int indexProgress;
  CheckOutState(
      {required this.name,
      required this.address,
      required this.city,
      required this.country,
      required this.zipCode,
      required this.paymentMethod,
      this.banks,
      this.cc,
      this.paypal,
      required this.progress,
      required this.indexProgress});
}

class CheckOutInitial extends CheckOutState {
  CheckOutInitial()
      : super(
            name: "Alex",
            address: "",
            city: "",
            country: "",
            zipCode: "",
            paymentMethod: -1,
            progress: 0,
            indexProgress: 0);
}

class CheckOutProcessing extends CheckOutState {
  CheckOutProcessing({
    required super.name,
    required super.address,
    required super.city,
    required super.country,
    required super.zipCode,
    required super.paymentMethod,
    required super.progress,
    required super.indexProgress,
    required String? bank,
    required CreditCard? cc,
    required String? paypal,
  }) : super(banks: bank, cc: cc, paypal: paypal);
}
