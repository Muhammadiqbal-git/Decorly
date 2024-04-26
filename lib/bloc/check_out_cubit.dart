import 'package:decorly/models/cc_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());
  
  String getPaymentMethod(int option) {
    if (option == 1) {
      return "Bank";
    } else if (option == 2) {
      return "Credit Card";
    } else if (option == 3) {
      return "PayPal";
    } else if (option == 4) {
      return "CashOnDelivery";
    } else {
      return "";
    }
  }

  updateIndexProgress(int idx) {
    emit(CheckOutProcessing(
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: state.paymentMethod,
        progress: state.progress,
        indexProgress: idx));
  }

  addressProcess(String address, String city, String country, String zipCode) {
    emit(CheckOutProcessing(
        address: address,
        city: city,
        country: country,
        zipCode: zipCode,
        paymentMethod: state.paymentMethod,
        progress: 1,
        indexProgress: 1));
  }

  bankPayment(String bankinfo, int paymentMethod) {
    emit(CheckOutProcessing(
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: paymentMethod,
        bank: bankinfo,
        progress: 2,
        indexProgress: 2));
  }

  ccPayment(String name, String ccNumber, String expDate, String code,
      int paymentMethod) {
    emit(CheckOutProcessing(
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: paymentMethod,
        cc: CreditCard(
            name: name, ccNumber: ccNumber, expDate: expDate, code: code),
        progress: 2,
        indexProgress: 2));
  }

  paypalPayment(String email, int paymentMethod) {
    emit(CheckOutProcessing(
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: paymentMethod,
        paypal: email,
        progress: 2,
        indexProgress: 2));
  }

  codPayment(int paymentMethod) {
    emit(CheckOutProcessing(
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: 4,
        progress: 2,
        indexProgress: 2));
  }
}
