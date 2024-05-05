import 'package:decorly/bloc/order_cubit.dart';
import 'package:decorly/screens/my_track_order.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white_cr,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "My Orders",
          style: body_1.copyWith(color: text_cr),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const ImageIcon(
            AssetImage("assets/imgs/icons/back_arrow.png"),
            color: text_cr,
          ),
        ),
      ),
      backgroundColor: white_cr,
      body: DefaultTabController(
        animationDuration: const Duration(milliseconds: 120),
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 0),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: accent_cr,
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.zero,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
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
                      text: "Current Orders",
                    ),
                    Tab(
                      text: "Past Orders",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: BlocBuilder<OrderCubit, OrderState>(
                      builder: (context, state) {
                        if (state is OrderEmpty) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: getHeight(15),
                              ),
                              SvgPicture.asset("assets/imgs/cart_no.svg"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "You have no current orders!",
                                style: body_1,
                              ),
                              SizedBox(
                                height: getHeight(10),
                              ),
                              CustomButton(
                                function: () {},
                                colorButton: primary_cr,
                                widthButton: 130,
                                heightButton: 48,
                                childButton: Text(
                                  "Order Now",
                                  style: body_1.copyWith(color: accent_cr),
                                ),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: List.generate(
                              state.orderList.length,
                              (index) => CustomCard(
                                heightContainer: 158,
                                widthContainer: double.maxFinite,
                                backgroundColor: accent_cr,
                                marginContainer: const EdgeInsets.only(
                                    left: 16, right: 16, bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat("MMM d, y").format(
                                              state.orderList[index].date),
                                          style: body_2.copyWith(
                                              fontSize: 14, color: text_cr),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  MyTrackOrder(index: index),
                                            ));
                                          },
                                          overlayColor:
                                              const MaterialStatePropertyAll(
                                                  Colors.transparent),
                                          child: Text(
                                            "Track Order",
                                            style: body_2.copyWith(
                                                fontSize: 14,
                                                color: primary_cr),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        DateFormat("hh:mm a").format(
                                            state.orderList[index].date),
                                        style: body_2.copyWith(
                                            fontSize: 11,
                                            color: subtle_text_cr)),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: state.orderList[index].item
                                            .map(
                                              (key, value) => MapEntry(
                                                key,
                                                Row(
                                                  children: [
                                                    CustomCard2(
                                                      colorCard: accent_cr,
                                                      widthCard: 77,
                                                      heightCard: 60,
                                                      borderColor: white_cr,
                                                      borderWidth: 10,
                                                      childCard: Image.asset(
                                                          value.img),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          value.name,
                                                          style:
                                                              body_2.copyWith(
                                                                  fontSize: 13,
                                                                  color:
                                                                      text_cr),
                                                        ),
                                                        Text(
                                                          "\$${value.price} x ${state.orderList[index].itemPCS[key]}",
                                                          style:
                                                              body_2.copyWith(
                                                                  fontSize: 10,
                                                                  color:
                                                                      text_cr),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Text(
                                                          "\$${value.price * state.orderList[index].itemPCS[key]!.toDouble()}",
                                                          style: body_2.copyWith(
                                                              fontSize: 13,
                                                              color:
                                                                  primary_cr),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      width: 5,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 10),
                                                      color: primary_cr
                                                          .withOpacity(0.50),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .values
                                            .toList(),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Items :  ${state.orderList[index].totalItem}",
                                          style: body_2.copyWith(
                                              fontSize: 12, color: text_cr),
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          "Total Price :  \$${state.orderList[index].totalCost}",
                                          style: body_2.copyWith(
                                              fontSize: 12, color: primary_cr),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: getHeight(15),
                        ),
                        SvgPicture.asset("assets/imgs/cart_no.svg"),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "You have no past orders!",
                          style: body_1,
                        ),
                        SizedBox(
                          height: getHeight(10),
                        ),
                        CustomButton(
                          function: () {},
                          colorButton: primary_cr,
                          widthButton: 130,
                          heightButton: 48,
                          childButton: Text(
                            "Order Now",
                            style: body_1.copyWith(color: accent_cr),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
