import 'package:decorly/bloc/cart_cubit.dart';
import 'package:decorly/bloc/check_out_cubit.dart';
import 'package:decorly/bloc/order_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:decorly/widgets/price_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CheckOutReviewSection extends StatelessWidget {
  const CheckOutReviewSection({super.key});
  final List<String> creditCardList = const ['MasterCard', 'Visa'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<CheckOutCubit, CheckOutState>(
        builder: (context, state) {
          print("built review");
          if (state.paymentMethod == -1) {
            return Center(
              child: Text("Choose your payment method first"),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please confirm and submit your order",
                  style: body_1.copyWith(color: text_cr),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCard(
                  heightContainer: 112,
                  widthContainer: double.maxFinite,
                  backgroundColor: accent_cr,
                  paddingContainer: EdgeInsets.all(10),
                  child: BlocBuilder<CheckOutCubit, CheckOutState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Shipping Address",
                                style: body_2.copyWith(color: subtle_text_cr),
                              ),
                              const Spacer(),
                              InkWell(
                                overlayColor: MaterialStatePropertyAll(
                                    Colors.transparent),
                                child:
                                    Image.asset("assets/imgs/icons/edit.png"),
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Name",
                                  style: body_1.copyWith(
                                      fontSize: 11, color: text_cr),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  state.name,
                                  style: body_2.copyWith(
                                      fontSize: 11, color: subtle_text_cr),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Street",
                                  style: body_1.copyWith(
                                      fontSize: 11, color: text_cr),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  state.address,
                                  style: body_2.copyWith(
                                      fontSize: 11, color: subtle_text_cr),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "City, State, Zip",
                                  style: body_1.copyWith(
                                      fontSize: 11, color: text_cr),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "${state.city}, ${state.country}, ${state.zipCode}",
                                  style: body_2.copyWith(
                                      fontSize: 11, color: subtle_text_cr),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<CheckOutCubit, CheckOutState>(
                  builder: (context, state) {
                    switch (state.paymentMethod) {
                      case 0:
                        return CustomCard(
                          heightContainer: 153,
                          widthContainer: double.maxFinite,
                          backgroundColor: accent_cr,
                          paddingContainer: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Payment Method",
                                    style:
                                        body_2.copyWith(color: subtle_text_cr),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    child: Image.asset(
                                        "assets/imgs/icons/edit.png"),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/imgs/icons/bank.png"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "BCA Bank Transfere",
                                        style:
                                            body_2.copyWith(color: primary_cr),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Virtual account number",
                                    style: body_2.copyWith(
                                        fontSize: 11, color: subtle_text_cr),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: CustomForm(
                                        borders: Border.all(
                                            color: text_cr, width: 0.5),
                                        width: getWidth(65),
                                        textEditingController:
                                            TextEditingController(
                                                text: state.banks),
                                        textInputAction: TextInputAction.done,
                                        isObsecure: true),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      case 1:
                        return CustomCard(
                          heightContainer: 240,
                          widthContainer: double.maxFinite,
                          backgroundColor: accent_cr,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Payment Method",
                                    style:
                                        body_2.copyWith(color: subtle_text_cr),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    child: Image.asset(
                                        "assets/imgs/icons/edit.png"),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomCard(
                                  heightContainer: 185,
                                  widthContainer: double.maxFinite,
                                  backgroundColor: text_cr,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name",
                                            style: body_2.copyWith(
                                                color: white_cr),
                                          ),
                                          SizedBox(
                                            width: getWidth(40),
                                            child: TextField(
                                              controller: TextEditingController(
                                                  text: state.cc?.name),
                                              enabled: false,
                                              cursorColor: accent_cr,
                                              style: body_2.copyWith(
                                                  color: subtle_text_cr),
                                              decoration: InputDecoration(
                                                  hintStyle: body_2.copyWith(
                                                      color: subtle_text_cr),
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 5, 0, 10),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      text_cr)),
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: text_cr))),
                                            ),
                                          ),
                                          Text(
                                            "Card Number",
                                            style: body_2.copyWith(
                                                color: white_cr),
                                          ),
                                          SizedBox(
                                            width: getWidth(40),
                                            child: TextField(
                                              controller: TextEditingController(
                                                  text: state.cc?.ccNumber),
                                              enabled: false,
                                              cursorColor: accent_cr,
                                              style: body_2.copyWith(
                                                  color: subtle_text_cr),
                                              decoration: InputDecoration(
                                                  hintStyle: body_2.copyWith(
                                                      color: subtle_text_cr),
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 5, 0, 10),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      text_cr)),
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: text_cr))),
                                            ),
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Text(
                                                "Expiration Date",
                                                style: body_2.copyWith(
                                                    color: white_cr),
                                              ),
                                              SizedBox(
                                                width: 45,
                                                child: TextField(
                                                  controller:
                                                      TextEditingController(
                                                          text: state
                                                              .cc?.expDate),
                                                  enabled: false,
                                                  cursorColor: accent_cr,
                                                  style: body_2.copyWith(
                                                      color: subtle_text_cr),
                                                  decoration: InputDecoration(
                                                      hintStyle: body_2.copyWith(
                                                          color:
                                                              subtle_text_cr),
                                                      isDense: true,
                                                      contentPadding:
                                                          const EdgeInsets
                                                              .fromLTRB(
                                                              0, 5, 0, 10),
                                                      focusedBorder:
                                                          const UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          text_cr)),
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          text_cr))),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Radio(
                                                fillColor: MaterialStateProperty
                                                    .resolveWith((states) {
                                                  if (states.contains(
                                                      MaterialState.selected)) {
                                                    return secondary_cr;
                                                  } else {
                                                    return accent_cr;
                                                  }
                                                }),
                                                value: creditCardList[0],
                                                groupValue:
                                                    state.cc?.type ?? "",
                                                onChanged: (value) {},
                                              ),
                                              Image.asset(
                                                  "assets/imgs/mastercard.png")
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                fillColor: MaterialStateProperty
                                                    .resolveWith((states) {
                                                  if (states.contains(
                                                      MaterialState.selected)) {
                                                    return secondary_cr;
                                                  } else {
                                                    return accent_cr;
                                                  }
                                                }),
                                                value: creditCardList[1],
                                                groupValue:
                                                    state.cc?.type ?? "",
                                                onChanged: (value) {},
                                              ),
                                              Image.asset(
                                                  "assets/imgs/visa.png")
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            "Security Code",
                                            style: body_2.copyWith(
                                                color: white_cr),
                                          ),
                                          SizedBox(
                                            width: 30,
                                            child: TextField(
                                              controller: TextEditingController(
                                                  text: state.cc?.code),
                                              enabled: false,
                                              cursorColor: accent_cr,
                                              style: body_2.copyWith(
                                                  color: subtle_text_cr),
                                              decoration: InputDecoration(
                                                  hintStyle: body_2.copyWith(
                                                      color: subtle_text_cr),
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 5, 0, 10),
                                                  focusedBorder:
                                                      const UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      text_cr)),
                                                  enabledBorder:
                                                      const UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: text_cr))),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        );
                      case 2:
                        return CustomCard(
                          heightContainer: 80,
                          widthContainer: double.maxFinite,
                          backgroundColor: accent_cr,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Payment Method",
                                    style:
                                        body_2.copyWith(color: subtle_text_cr),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    child: Image.asset(
                                        "assets/imgs/icons/edit.png"),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/imgs/paypal.svg",
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  BlocBuilder<CheckOutCubit, CheckOutState>(
                                    builder: (context, state) {
                                      return Text(
                                        state.paypal ?? "",
                                        style: body_2.copyWith(
                                            fontSize: 11,
                                            color: subtle_text_cr),
                                      );
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      case 3:
                        return CustomCard(
                          heightContainer: 80,
                          widthContainer: double.maxFinite,
                          backgroundColor: accent_cr,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Payment Method",
                                    style:
                                        body_2.copyWith(color: subtle_text_cr),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    child: Image.asset(
                                        "assets/imgs/icons/edit.png"),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/imgs/cod.svg",
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Cash on Delivery",
                                    style: body_2.copyWith(
                                        fontSize: 11, color: subtle_text_cr),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      default:
                        return Placeholder();
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return PriceCardWidget(
                        subTotal: state.totalCost ?? 0,
                        delivery: state.deliveryCost ?? 0,
                        total:
                            (state.totalCost ?? 0) + (state.deliveryCost ?? 0));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          function: () {
                            BlocProvider.of<CheckOutCubit>(context).nextPage();
                            BlocProvider.of<CheckOutCubit>(context)
                                .reviewProcess();
                            BlocProvider.of<OrderCubit>(context).addOrder(
                                state.itemCart,
                                state.itemPcs,
                                state.totalItem ?? 0,
                                (state.totalCost ?? 0.0) +
                                    (state.deliveryCost ?? 0.0));
                          },
                          colorButton: primary_cr,
                          widthButton: 150,
                          heightButton: 48,
                          childButton: Text(
                            "Submit",
                            style: body_1.copyWith(color: accent_cr),
                          )),
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
