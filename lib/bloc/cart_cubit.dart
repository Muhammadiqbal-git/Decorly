import 'package:decorly/models/bank_model.dart';
import 'package:decorly/models/cc_model.dart';
import 'package:decorly/models/furniture_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartEmpty());

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
        address: "",
        city: "",
        country: "",
        zipCode: "",
        paymentMethod: 0,
        totalItem: countTotalItem(state.itemPcs),
        deliveryC: 59,
        totalC: countTotalCost(state.itemCart, state.itemPcs),
        progress: 0));
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
        address: "",
        city: "",
        country: "",
        zipCode: "",
        paymentMethod: 0,
        totalItem: countTotalItem(state.itemPcs),
        deliveryC: 59,
        totalC: countTotalCost(state.itemCart, state.itemPcs),
        progress: 0));
    if (state.itemCart.isEmpty) {
      emit(CartEmpty());
    }
  }
  
  addressProcess(String address, String city, String country, String zipCode) {
    emit(CartCheckout(
        itemCart: state.itemCart,
        itemPcs: state.itemPcs,
        address: address,
        city: city,
        country: country,
        zipCode: zipCode,
        paymentMethod: state.paymentMethod,
        progress: 1));
  }

  bankPayment(String bankinfo, int paymentMethod) {
    emit(CartCheckout(
        itemCart: state.itemCart,
        itemPcs: state.itemPcs,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: paymentMethod,
        bankInfo: bankinfo,
        progress: 2));
  }

  ccPayment(String name, String ccNumber, String expDate, String code,
      int paymentMethod) {
    emit(CartCheckout(
        itemCart: state.itemCart,
        itemPcs: state.itemPcs,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: paymentMethod,
        ccInfo: CreditCard(
            name: name, ccNumber: ccNumber, expDate: expDate, code: code),
        progress: 2));
  }

  paypalPayment(String email, int paymentMethod) {
    emit(CartCheckout(
        itemCart: state.itemCart,
        itemPcs: state.itemPcs,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: paymentMethod,
        paypal: email,
        progress: 2));
  }

  codPayment(int paymentMethod) {
    emit(CartCheckout(
        itemCart: state.itemCart,
        itemPcs: state.itemPcs,
        address: state.address,
        city: state.city,
        country: state.country,
        zipCode: state.zipCode,
        paymentMethod: 4,
        progress: 2));
  }
}
