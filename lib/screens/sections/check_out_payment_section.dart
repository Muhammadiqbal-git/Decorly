import 'package:decorly/bloc/cart_cubit.dart';
import 'package:decorly/bloc/check_out_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:decorly/widgets/price_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CheckOutPaymentSection extends StatefulWidget {
  const CheckOutPaymentSection({super.key});

  @override
  State<CheckOutPaymentSection> createState() => _CheckOutPaymentSectionState();
}

class _CheckOutPaymentSectionState extends State<CheckOutPaymentSection> {
  final List<String> creditCardList = const ['MasterCard', 'Visa'];
  late TextEditingController bankNumber;
  late TextEditingController nameCC;
  late TextEditingController numberCC;
  late TextEditingController dateCC;
  late TextEditingController codeCC;
  late TextEditingController payPal;

  @override
  void initState() {
    // TODO: implement initState
    bankNumber = TextEditingController();
    nameCC = TextEditingController();
    numberCC = TextEditingController();
    dateCC = TextEditingController();
    codeCC = TextEditingController();
    payPal = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    print("disposed");
    bankNumber.dispose();
    nameCC.dispose();
    numberCC.dispose();
    dateCC.dispose();
    codeCC.dispose();
    payPal.dispose();
    super.dispose();
  }

  String currentCard = "MasterCard";

  @override
  Widget build(BuildContext context) {
    print(currentCard);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose a Payment Method",
            style: body_1,
          ),
          const SizedBox(
            height: 14,
          ),
          Expanded(
            child: DefaultTabController(
                animationDuration: const Duration(milliseconds: 120),
                length: 4,
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(12),
                      color: accent_cr,
                      child: TabBar(
                          labelPadding: EdgeInsets.zero,
                          indicatorColor: Colors.transparent,
                          indicator: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: text_cr.withOpacity(0.6),
                                  blurRadius: 3,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 3),
                                )
                              ],
                              color: primary_cr,
                              borderRadius: BorderRadius.circular(12)),
                          labelStyle: body_1.copyWith(fontSize: 13),
                          labelColor: white_cr,
                          unselectedLabelStyle: body_2.copyWith(fontSize: 12),
                          unselectedLabelColor: subtle_text_cr,
                          tabs: const [
                            Tab(
                              child: Text(
                                "Bank",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Credit Card",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "PayPal",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Cash On Delivery",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/imgs/bank.svg",
                                    width: getWidth(20),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    "Bca Bank Transfere",
                                    style: body_1.copyWith(color: primary_cr),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  CustomForm(
                                    textEditingController: bankNumber,
                                    hintText: "**** **** **** ****",
                                    textInputAction: TextInputAction.done,
                                    isObsecure: true,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Pay Before 14-05-2024 19:28",
                                      style: caption_1.copyWith(
                                          color: subtle_text_cr),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  BlocBuilder<CartCubit, CartState>(
                                    builder: (context, state) {
                                      return PriceCardWidget(
                                          subTotal: state.totalCost ?? 0,
                                          delivery: state.deliveryCost ?? 0,
                                          total: (state.totalCost ?? 0) +
                                              (state.deliveryCost ?? 0));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  CustomButton(
                                      function: () {
                                        BlocProvider.of<CheckOutCubit>(context)
                                            .nextPage();
                                        print("pressed");
                                        BlocProvider.of<CheckOutCubit>(context)
                                            .bankPayment(bankNumber.value.text);
                                      },
                                      colorButton: primary_cr,
                                      widthButton: double.maxFinite,
                                      heightButton: 48,
                                      childButton: Text(
                                        "Review",
                                        style:
                                            body_1.copyWith(color: accent_cr),
                                      )),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                            //cc payment
                            SingleChildScrollView(
                              child: Column(
                                children: [
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
                                                  controller: nameCC,
                                                  cursorColor: accent_cr,
                                                  style: body_2.copyWith(
                                                      color: subtle_text_cr),
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Your Name here",
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
                                              Text(
                                                "Card Number",
                                                style: body_2.copyWith(
                                                    color: white_cr),
                                              ),
                                              SizedBox(
                                                width: getWidth(40),
                                                child: TextField(
                                                  controller: numberCC,
                                                  cursorColor: accent_cr,
                                                  style: body_2.copyWith(
                                                      color: subtle_text_cr),
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Your Card Number here",
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
                                                              borderSide: BorderSide(
                                                                  color:
                                                                      text_cr)),
                                                      enabledBorder:
                                                          const UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color:
                                                                      text_cr))),
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
                                                      controller: dateCC,
                                                      cursorColor: accent_cr,
                                                      style: body_2.copyWith(
                                                          color:
                                                              subtle_text_cr),
                                                      decoration: InputDecoration(
                                                          hintText: "12/22",
                                                          hintStyle:
                                                              body_2.copyWith(
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
                                                                          color: text_cr))),
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
                                                    fillColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return secondary_cr;
                                                      } else {
                                                        return accent_cr;
                                                      }
                                                    }),
                                                    value: creditCardList[0],
                                                    groupValue: currentCard,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        currentCard =
                                                            value.toString();
                                                      });
                                                    },
                                                  ),
                                                  Image.asset(
                                                      "assets/imgs/mastercard.png")
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                    fillColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return secondary_cr;
                                                      } else {
                                                        return accent_cr;
                                                      }
                                                    }),
                                                    value: creditCardList[1],
                                                    groupValue: currentCard,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        currentCard =
                                                            value.toString();
                                                      });
                                                    },
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
                                                  controller: codeCC,
                                                  cursorColor: accent_cr,
                                                  style: body_2.copyWith(
                                                      color: subtle_text_cr),
                                                  decoration: InputDecoration(
                                                      hintText: "323",
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
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "You'll not be charged until you review this order on the next page",
                                    style: caption_1.copyWith(
                                        color: subtle_text_cr),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  BlocBuilder<CartCubit, CartState>(
                                    builder: (context, state) {
                                      return PriceCardWidget(
                                          subTotal: state.totalCost ?? 0,
                                          delivery: state.deliveryCost ?? 0,
                                          total: (state.totalCost ?? 0) +
                                              (state.deliveryCost ?? 0));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                      function: () {
                                        BlocProvider.of<CheckOutCubit>(context)
                                            .nextPage();
                                        BlocProvider.of<CheckOutCubit>(context)
                                            .ccPayment(
                                                nameCC.text,
                                                numberCC.text,
                                                dateCC.text,
                                                codeCC.text,
                                                currentCard);
                                      },
                                      colorButton: primary_cr,
                                      widthButton: double.maxFinite,
                                      heightButton: 48,
                                      childButton: Text(
                                        "Review",
                                        style:
                                            body_1.copyWith(color: accent_cr),
                                      )),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/imgs/paypal.svg",
                                    width: getWidth(20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Pay with PayPal",
                                    style: body_1.copyWith(color: primary_cr),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Enter your email or mobile number to get started.",
                                      style: body_1.copyWith(
                                          fontSize: 14, color: text_cr),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomForm(
                                      hintText: "Email or Mobile Number",
                                      textEditingController: payPal,
                                      textInputAction: TextInputAction.done),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Forgot email?",
                                      style: body_1.copyWith(
                                          fontSize: 10, color: text_cr),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  CustomButton(
                                      function: () {
                                        BlocProvider.of<CheckOutCubit>(context)
                                            .nextPage();
                                        BlocProvider.of<CheckOutCubit>(context)
                                            .paypalPayment(payPal.text);
                                      },
                                      colorButton: primary_cr,
                                      widthButton: double.maxFinite,
                                      heightButton: 48,
                                      childButton: Text(
                                        "Continue",
                                        style:
                                            body_1.copyWith(color: accent_cr),
                                      )),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    "assets/imgs/cod.svg",
                                    width: getWidth(20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "You'll be asked to pay when you receive your order.",
                                    style: body_2.copyWith(color: text_cr),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  BlocBuilder<CartCubit, CartState>(
                                    builder: (context, state) {
                                      return PriceCardWidget(
                                          subTotal: state.totalCost ?? 0,
                                          delivery: state.deliveryCost ?? 0,
                                          total: (state.totalCost ?? 0) +
                                              (state.deliveryCost ?? 0));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  CustomButton(
                                      function: () {
                                        BlocProvider.of<CheckOutCubit>(context)
                                            .nextPage();
                                        BlocProvider.of<CheckOutCubit>(context)
                                            .codPayment();
                                      },
                                      colorButton: primary_cr,
                                      widthButton: double.maxFinite,
                                      heightButton: 48,
                                      childButton: Text(
                                        "Review",
                                        style:
                                            body_1.copyWith(color: accent_cr),
                                      )),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
