import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white_cr,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const ImageIcon(
              AssetImage("assets/imgs/icons/back_arrow.png"),
              color: text_cr,
            )),
        title: Text(
          "Checkout",
          style: body_1.copyWith(color: text_cr),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 26,
                      width: 26,
                      margin: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                          color: subtle_text_cr,
                          borderRadius: BorderRadius.circular(50)),
                      alignment: Alignment.center,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: accent_cr,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Text(
                          "Address",
                          style: body_1.copyWith(color: text_cr),
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 6, right: 6, bottom: 25),
                  height: 3,
                  width: getWidth(14),
                  color: subtle_text_cr,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 26,
                      width: 26,
                      margin: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                          color: subtle_text_cr,
                          borderRadius: BorderRadius.circular(50)),
                      alignment: Alignment.center,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: accent_cr,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Text(
                          "Payment",
                          style: body_1.copyWith(color: text_cr),
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 6, right: 6, bottom: 25),
                  height: 3,
                  width: getWidth(14),
                  color: subtle_text_cr,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      clipBehavior: Clip.none,
                      height: 26,
                      width: 26,
                      margin: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                          color: subtle_text_cr,
                          borderRadius: BorderRadius.circular(50)),
                      alignment: Alignment.center,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: accent_cr,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Text(
                          "Review",
                          style: body_1.copyWith(color: text_cr),
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 6, right: 6, bottom: 25),
                  height: 3,
                  width: getWidth(14),
                  color: subtle_text_cr,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 26,
                      width: 26,
                      margin: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                          color: subtle_text_cr,
                          borderRadius: BorderRadius.circular(50)),
                      alignment: Alignment.center,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: accent_cr,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Text(
                          "Done",
                          style: body_1.copyWith(color: text_cr),
                        ))
                  ],
                ),
              ],
            ),
          ),
          //CONTENT
          Expanded(
            child: PageView(
              controller: PageController(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Street",
                          style: body_1.copyWith(color: text_cr),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomForm(
                            hintText: "West Xyz St",
                            textEditingController: TextEditingController(),
                            textInputAction: TextInputAction.next),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "City",
                                    style: body_1.copyWith(color: text_cr),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomForm(
                                      hintText: "Pontianak",
                                      textAlign: TextAlign.center,
                                      textEditingController:
                                          TextEditingController(),
                                      textInputAction: TextInputAction.next)
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "State",
                                    style: body_1.copyWith(color: text_cr),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomForm(
                                      hintText: "Indonesia",
                                      textAlign: TextAlign.center,
                                      textEditingController:
                                          TextEditingController(),
                                      textInputAction: TextInputAction.next)
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Zip Code",
                                    style: body_1.copyWith(color: text_cr),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomForm(
                                      hintText: "77221",
                                      textAlign: TextAlign.center,
                                      textEditingController:
                                          TextEditingController(),
                                      textInputAction: TextInputAction.done)
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: getHeight(10),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                              function: () {},
                              colorButton: primary_cr,
                              widthButton: 130,
                              heightButton: 48,
                              childButton: Text(
                                "Payment",
                                style: body_1.copyWith(color: accent_cr),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
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
                            animationDuration:
                                const Duration(milliseconds: 120),
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
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      labelStyle: body_1.copyWith(fontSize: 13),
                                      labelColor: white_cr,
                                      unselectedLabelStyle:
                                          body_2.copyWith(fontSize: 12),
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                                style: body_1.copyWith(
                                                    color: primary_cr),
                                              ),
                                              const SizedBox(
                                                height: 14,
                                              ),
                                              CustomForm(
                                                textEditingController:
                                                    TextEditingController(),
                                                textInputAction:
                                                    TextInputAction.done,
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
                                              CustomCard(
                                                backgroundColor: accent_cr,
                                                widthContainer: double.infinity,
                                                heightContainer: 124,
                                                paddingContainer:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 14),
                                                marginContainer:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 14),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Subtotal",
                                                          style: body_1.copyWith(
                                                              color:
                                                                  subtle_text_cr),
                                                        ),
                                                        Text(
                                                          // "${state.totalCost!.toStringAsFixed(2)}\$",
                                                          "10.00\$",
                                                          style: body_1.copyWith(
                                                              color:
                                                                  subtle_text_cr),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Delivery",
                                                          style: body_1.copyWith(
                                                              color:
                                                                  subtle_text_cr),
                                                        ),
                                                        Text(
                                                          // "${state.deliveryCost}\$",
                                                          "10.00\$",

                                                          style: body_1.copyWith(
                                                              color:
                                                                  subtle_text_cr),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Total",
                                                          style: body_1.copyWith(
                                                              color:
                                                                  primary_cr),
                                                        ),
                                                        Text(
                                                          // "${(state.totalCost! + state.deliveryCost!).toStringAsFixed(2)}\$",
                                                          "10.00\$",

                                                          style: body_1.copyWith(
                                                              fontSize: 20,
                                                              color:
                                                                  primary_cr),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 24,
                                              ),
                                              CustomButton(
                                                  function: () {},
                                                  colorButton: primary_cr,
                                                  widthButton: double.maxFinite,
                                                  heightButton: 48,
                                                  childButton: Text(
                                                    "Review",
                                                    style: body_1.copyWith(
                                                        color: accent_cr),
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
                                                  widthContainer:
                                                      double.maxFinite,
                                                  backgroundColor: text_cr,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Name",
                                                            style:
                                                                body_2.copyWith(
                                                                    color:
                                                                        white_cr),
                                                          ),
                                                          SizedBox(
                                                            width: getWidth(40),
                                                            child: TextField(
                                                              controller:
                                                                  TextEditingController(),
                                                              cursorColor:
                                                                  accent_cr,
                                                              style: body_2
                                                                  .copyWith(
                                                                      color:
                                                                          subtle_text_cr),
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      "Your Name here",
                                                                  hintStyle: body_2
                                                                      .copyWith(
                                                                          color:
                                                                              subtle_text_cr),
                                                                  isDense: true,
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              10),
                                                                  focusedBorder: const UnderlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color:
                                                                              text_cr)),
                                                                  enabledBorder:
                                                                      const UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: text_cr))),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Card Number",
                                                            style:
                                                                body_2.copyWith(
                                                                    color:
                                                                        white_cr),
                                                          ),
                                                          SizedBox(
                                                            width: getWidth(40),
                                                            child: TextField(
                                                              controller:
                                                                  TextEditingController(),
                                                              cursorColor:
                                                                  accent_cr,
                                                              style: body_2
                                                                  .copyWith(
                                                                      color:
                                                                          subtle_text_cr),
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      "Your Card Number here",
                                                                  hintStyle: body_2
                                                                      .copyWith(
                                                                          color:
                                                                              subtle_text_cr),
                                                                  isDense: true,
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              10),
                                                                  focusedBorder: const UnderlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color:
                                                                              text_cr)),
                                                                  enabledBorder:
                                                                      const UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: text_cr))),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "Expiration Date",
                                                                style: body_2
                                                                    .copyWith(
                                                                        color:
                                                                            white_cr),
                                                              ),
                                                              SizedBox(
                                                                width: 45,
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      TextEditingController(),
                                                                  cursorColor:
                                                                      accent_cr,
                                                                  style: body_2
                                                                      .copyWith(
                                                                          color:
                                                                              subtle_text_cr),
                                                                  decoration: InputDecoration(
                                                                      hintText:
                                                                          "12/22",
                                                                      hintStyle: body_2.copyWith(
                                                                          color:
                                                                              subtle_text_cr),
                                                                      isDense:
                                                                          true,
                                                                      contentPadding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              10),
                                                                      focusedBorder: const UnderlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color:
                                                                                  text_cr)),
                                                                      enabledBorder:
                                                                          const UnderlineInputBorder(
                                                                              borderSide: BorderSide(color: text_cr))),
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
                                                              const Icon(
                                                                  Icons.circle),
                                                              Image.asset(
                                                                  "assets/imgs/mastercard.png")
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Icon(
                                                                  Icons.circle),
                                                                  // Radio(value: value, groupValue: groupValue, onChanged: onChanged)
                                                              Image.asset(
                                                                  "assets/imgs/visa.png")
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            "Security Code",
                                                            style:
                                                                body_2.copyWith(
                                                                    color:
                                                                        white_cr),
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                            child: TextField(
                                                              controller:
                                                                  TextEditingController(),
                                                              cursorColor:
                                                                  accent_cr,
                                                              style: body_2
                                                                  .copyWith(
                                                                      color:
                                                                          subtle_text_cr),
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      "323",
                                                                  hintStyle: body_2
                                                                      .copyWith(
                                                                          color:
                                                                              subtle_text_cr),
                                                                  isDense: true,
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              10),
                                                                  focusedBorder: const UnderlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color:
                                                                              text_cr)),
                                                                  enabledBorder:
                                                                      const UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: text_cr))),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/imgs/paypal.svg",
                                              width: getWidth(20),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/imgs/cod.svg",
                                              width: getWidth(20),
                                            )
                                          ],
                                        ),
                                      ]),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
