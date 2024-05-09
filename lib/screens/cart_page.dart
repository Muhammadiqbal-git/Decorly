import 'package:decorly/bloc/cart_cubit.dart';
import 'package:decorly/bloc/check_out_cubit.dart';
import 'package:decorly/bloc/shop_cubit.dart';
import 'package:decorly/screens/check_out.dart';
import 'package:decorly/screens/shop_page.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:decorly/widgets/price_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  AppBar appBar() {
    return AppBar(
      backgroundColor: white_cr,
      title: Text(
        "My Cart",
        style: body_1.copyWith(color: text_cr),
      ),
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late TextEditingController _promoCodeController;

  @override
  void initState() {
    _promoCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/imgs/cart_empty.svg",
                  width: getWidth(30),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Your Cart is Empty!",
                  style: body_1.copyWith(fontSize: 20, color: primary_cr),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Such unique products are always  available on the store, order some now!",
                  style: body_2.copyWith(fontSize: 14, color: text_cr),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    function: () {
                      BlocProvider.of<ShopCubit>(context).getData([""]);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ShopPage(),
                      ));
                    },
                    colorButton: primary_cr,
                    widthButton: getWidth(60),
                    heightButton: 48,
                    childButton: Text(
                      "Shop Now",
                      style: body_1.copyWith(color: accent_cr),
                    ))
              ],
            );
          } 
          else if (state is CartFilled) {
            return SingleChildScrollView(
              child: Column(children: [
                ...state.itemCart
                    .map((key, value) => MapEntry(
                          key,
                          Container(
                              height: 120,
                              width: double.maxFinite,
                              padding: EdgeInsets.zero,
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                  color: accent_cr,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: text_cr.withOpacity(0.4),
                                        spreadRadius: -3.5,
                                        blurRadius: 6,
                                        offset: const Offset(0, 5))
                                  ]),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      CustomCard2(
                                          colorCard: accent_cr,
                                          widthCard: 90,
                                          heightCard: 90,
                                          padding: const EdgeInsets.all(5),
                                          borderColor: white_cr,
                                          borderWidth: 9,
                                          childCard: Image.asset(value.img)),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Text(
                                          value.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: body_1.copyWith(
                                              color: text_cr,
                                              letterSpacing: 0.4),
                                        ),
                                        Text(
                                          value.desc,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.justify,
                                          style:
                                              body_2.copyWith(color: text_cr),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "\$${value.price}",
                                          style: body_1.copyWith(
                                              fontSize: 19, color: text_cr),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        14, 15, 15, 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          overlayColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          onTap: () {
                                            BlocProvider.of<CartCubit>(context)
                                                .increaseItem(value);
                                          },
                                          child: const ImageIcon(
                                            AssetImage(
                                                "assets/imgs/icons/plus.png"),
                                            color: secondary_cr,
                                          ),
                                        ),
                                        Text(
                                          state.itemPcs[key].toString(),
                                          style:
                                              body_1.copyWith(color: text_cr),
                                        ),
                                        InkWell(
                                          overlayColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          onTap: () {
                                            BlocProvider.of<CartCubit>(context)
                                                .decreaseItem(value);
                                          },
                                          child: const ImageIcon(
                                            AssetImage(
                                                "assets/imgs/icons/min.png"),
                                            color: secondary_cr,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ))
                    .values,
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Positioned(
                      child: CustomForm(
                        hintText: "Promo Code",
                          textEditingController: _promoCodeController,
                          textInputAction: TextInputAction.done),
                    ),
                    Positioned(
                        right: 0,
                        child: CustomButton(
                            function: () {},
                            colorButton: primary_cr,
                            widthButton: 44,
                            heightButton: 44,
                            childButton: const ImageIcon(
                              AssetImage("assets/imgs/icons/checklist.png"),
                              color: accent_cr,
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PriceCardWidget(
                    subTotal: state.totalCost ?? 0,
                    delivery: state.deliveryCost ?? 0,
                    total: (state.totalCost ?? 0) + (state.deliveryCost ?? 0)),
                SizedBox(
                  height: getHeight(5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        function: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ShopPage(),
                          ));
                        },
                        colorButton: primary_cr,
                        widthButton: 100,
                        heightButton: 48,
                        childButton: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "More",
                              style: body_1.copyWith(color: accent_cr),
                            ),
                            const SizedBox(
                              width: 11,
                            ),
                            const ImageIcon(
                              AssetImage("assets/imgs/icons/cart.png"),
                              color: accent_cr,
                            )
                          ],
                        )),
                    CustomButton(
                        function: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => CheckOutCubit(),
                              child: const CheckOutPage(),
                            ),
                          ));
                        },
                        colorButton: primary_cr,
                        widthButton: 160,
                        heightButton: 48,
                        childButton: Text(
                          "Check Out",
                          style: body_1.copyWith(color: accent_cr),
                        ))
                  ],
                )
              ]),
            );
          } 
          
          else {
            return Center(
              child: Text(
                "Kesalahan terjadi pada sistem, coba lagi nanti",
                style: body_1.copyWith(color: primary_cr),
              ),
            );
          }
        },
      ),
    );
  }
}
