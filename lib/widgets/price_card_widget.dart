import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_card2.dart';
import 'package:flutter/material.dart';

class PriceCardWidget extends StatelessWidget {
  final double subTotal;
  final double delivery;
  final double total;
  const PriceCardWidget({super.key, required this.subTotal, required this.delivery, required this.total});

  @override
  Widget build(BuildContext context) {
    return CustomCard2(
                    colorCard: accent_cr,
                    widthCard: double.infinity,
                    heightCard: 124,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: body_1.copyWith(color: subtle_text_cr),
                            ),
                            Text(
                              "${subTotal.toStringAsFixed(2)}\$",
                              style: body_1.copyWith(color: subtle_text_cr),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery",
                              style: body_1.copyWith(color: subtle_text_cr),
                            ),
                            Text(
                              "${delivery.toStringAsFixed(2)}\$",
                              style: body_1.copyWith(color: subtle_text_cr),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: body_1.copyWith(color: primary_cr),
                            ),
                            Text(
                              "${(total).toStringAsFixed(2)}\$",
                              style: body_1.copyWith(
                                  fontSize: 20, color: primary_cr),
                            ),
                          ],
                        ),
                      ],
                    ));
  }
}