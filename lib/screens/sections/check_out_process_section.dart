import 'package:decorly/bloc/cart_cubit.dart';
import 'package:decorly/bloc/check_out_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutProcessWidget extends StatelessWidget {
  const CheckOutProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("proggress section built");
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              BlocBuilder<CheckOutCubit, CheckOutState>(
                builder: (context, state) {
                  return Container(
                    height: 26,
                    width: 26,
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        color: state.progress > 0 ? primary_cr : subtle_text_cr,
                        borderRadius: BorderRadius.circular(50)),
                    alignment: Alignment.center,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: state.indexProgress == 0 ? secondary_cr : accent_cr,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  );
                },
              ),
              Positioned(
                  bottom: 0,
                  child: Text(
                    "Address",
                    style: body_1.copyWith(color: text_cr),
                  ))
            ],
          ),
          BlocBuilder<CheckOutCubit, CheckOutState>(
            builder: (context, state) {
              return Container(
                margin: const EdgeInsets.only(left: 6, right: 6, bottom: 25),
                height: 3,
                width: getWidth(14),
                color: state.progress > 0 ? primary_cr : subtle_text_cr,
              );
            },
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              BlocBuilder<CheckOutCubit, CheckOutState>(
                builder: (context, state) {
                  return Container(
                    height: 26,
                    width: 26,
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        color:
                            state.progress == 1 ? primary_cr : subtle_text_cr,
                        borderRadius: BorderRadius.circular(50)),
                    alignment: Alignment.center,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: state.indexProgress == 1 ? secondary_cr : accent_cr,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  );
                },
              ),
              Positioned(
                  bottom: 0,
                  child: Text(
                    "Payment",
                    style: body_1.copyWith(color: text_cr),
                  ))
            ],
          ),
          BlocBuilder<CheckOutCubit, CheckOutState>(
            builder: (context, state) {
              return Container(
                margin: const EdgeInsets.only(left: 6, right: 6, bottom: 25),
                height: 3,
                width: getWidth(14),
                color: subtle_text_cr,
              );
            },
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              BlocBuilder<CheckOutCubit, CheckOutState>(
                builder: (context, state) {
                  return Container(
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
                  );
                },
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
    );
  }
}
