import 'package:decorly/models/cc_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  void nextPage() {
    _pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void animateToPage(int indx) {
    _pageController.animateToPage(indx,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Future<void> close() {
    print("closed");
    _pageController.dispose();
    return super.close();
  }

  String getPaymentMethod(int option) {
    if (option == 0) {
      return "Bank";
    } else if (option == 1) {
      return "Credit Card";
    } else if (option == 2) {
      return "PayPal";
    } else if (option == 3) {
      return "CashOnDelivery";
    } else {
      return "";
    }
  }

  updateIndexProgress(int idx) {
    emit(CheckOutProcessing(
      name: state.name,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: state.paymentMethod,
        bank: state.banks,
        cc: state.cc,
        paypal: state.paypal,
        progress: state.progress,
        indexProgress: idx));
  }

  // updatePaymentMethod(int idx) {
  //   emit(CheckOutProcessing(
    // name: state.name,
  //       address: state.address,
  //       city: state.city,
  //       country: state.country,
  //       zipCode: state.zipCode,
  //       paymentMethod: idx,
  //       progress: state.progress,
  //       indexProgress: state.indexProgress));
  // }

  addressProcess(String address, String city, String country, String zipCode) {
    emit(CheckOutProcessing(
      name: state.name,
        address: address,
        city: city,
        country: country,
        zipCode: zipCode,
        paymentMethod: state.paymentMethod,
        bank: state.banks,
        cc: state.cc,
        paypal: state.paypal,
        progress: 1,
        indexProgress: 1));
  }

  bankPayment(String bankinfo) {
    print(state.paymentMethod);
    emit(CheckOutProcessing(
      name: state.name,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: 0,
        bank: bankinfo,
        cc: state.cc,
        paypal: state.paypal,
        progress: 2,
        indexProgress: 2));
  }

  ccPayment(
      String name, String ccNumber, String expDate, String code, String type) {
    emit(CheckOutProcessing(
      name: state.name,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: 1,
        bank: state.banks,
        cc: CreditCard(
            name: name,
            ccNumber: ccNumber,
            expDate: expDate,
            code: code,
            type: type),
        paypal: state.paypal,
        progress: 2,
        indexProgress: 2));
  }

  paypalPayment(String email) {
    emit(CheckOutProcessing(
      name: state.name,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: 2,
        bank: state.banks,
        cc: state.cc,
        paypal: email,
        progress: 2,
        indexProgress: 2));
  }

  codPayment() {
    emit(CheckOutProcessing(
      name: state.name,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: 3,
        bank: state.banks,
        cc: state.cc,
        paypal: state.paypal,
        progress: 2,
        indexProgress: 2));
  }

  reviewProcess() {
    emit(CheckOutProcessing(
      name: state.name,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: state.paymentMethod,
        progress: 3,
        indexProgress: 3,
        bank: state.banks,
        cc: state.cc,
        paypal: state.paypal));
  }
}
