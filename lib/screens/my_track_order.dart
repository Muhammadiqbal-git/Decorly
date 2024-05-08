import 'package:decorly/bloc/order_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTrackOrder extends StatelessWidget {
  final int index;
  const MyTrackOrder({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white_cr,
        title: Text(
          "Tracking Order",
          style: body_1.copyWith(color: text_cr),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
        child: Column(
          children: [
            Text(
              "Your order is on the way!",
              style: body_1.copyWith(color: primary_cr),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomCard(
              heightContainer: 168,
              widthContainer: double.maxFinite,
              backgroundColor: accent_cr,
              child: Column(
                children: [
                  BlocBuilder<OrderCubit, OrderState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: state.orderList[index].item
                              .map(
                                (key, value) => MapEntry(
                                  key,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomCard2(
                                        colorCard: accent_cr,
                                        widthCard: 90,
                                        heightCard: 90,
                                        borderColor: white_cr,
                                        borderWidth: 10,
                                        childCard: Image.asset(value.img),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.name,
                                            style: body_1.copyWith(
                                                fontSize: 14, color: text_cr),
                                          ),
                                          Text(
                                            "Quantity : ${state.orderList[index].itemPCS[key]}",
                                            style: body_2.copyWith(
                                                fontSize: 13, color: text_cr),
                                          ),
                                          const SizedBox(
                                            height: 23,
                                          ),
                                          Text(
                                            "\$${(value.price * state.orderList[index].itemPCS[key]!.toDouble()).toStringAsFixed(2)}",
                                            style:
                                                body_1.copyWith(color: text_cr),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 85,
                                        width: 5,
                                        margin: const EdgeInsets.only(
                                            left: 5, right: 10),
                                        color: primary_cr.withOpacity(0.50),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .values
                              .toList(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "#5863US",
                            style: body_1.copyWith(color: primary_cr),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Tracking Number",
                            style: body_2.copyWith(color: text_cr),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "3 Days",
                            style: body_1.copyWith(color: primary_cr),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Est Remaining Time",
                            style: body_2.copyWith(color: text_cr),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomCard(
                heightContainer: null,
                widthContainer: double.maxFinite,
                backgroundColor: accent_cr,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                  color: primary_cr,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Container(
                              height: 40,
                              width: 2,
                              color: primary_cr,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                            )
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tracking Number Created",
                              style: body_1.copyWith(color: text_cr),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              "Tracking Number Created",
                              style: body_2.copyWith(color: subtle_text_cr),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                  color: primary_cr,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Container(
                              height: 40,
                              width: 2,
                              color: primary_cr,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                            )
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "In Transit",
                              style: body_1.copyWith(color: text_cr),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              "San Francisco, CA  .  July 15 ,  6:03pm",
                              style: body_2.copyWith(color: subtle_text_cr),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                  color: primary_cr,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            Container(
                              height: 40,
                              width: 2,
                              color: primary_cr,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                            )
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Out For Delivery",
                              style: body_1.copyWith(color: text_cr),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              "Courier : Carole Chimaku",
                              style: body_2.copyWith(color: subtle_text_cr),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                  color: subtle_text_cr,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivered",
                              style: body_1.copyWith(color: text_cr),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ],
                    ),
                    
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
