import 'package:decorly/bloc/cart_cubit.dart';
import 'package:decorly/bloc/main_page_cubit.dart';
import 'package:decorly/bloc/order_cubit.dart';
import 'package:decorly/screens/my_order_page.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CheckOutDoneSection extends StatelessWidget {
  const CheckOutDoneSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/imgs/cart_done.svg",
            width: getWidth(20),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Order Placed Succesfully!",
            style: body_1.copyWith(color: primary_cr),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Your order has been placed sucessfully  and is being processced for delivery.",
            style: body_2.copyWith(color: text_cr),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getHeight(12),
          ),
          CustomButton(
            function: () {
              BlocProvider.of<CartCubit>(context).clearItem();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyOrderPage(),));
            },
            colorButton: primary_cr,
            widthButton: 130,
            heightButton: 48,
            childButton: Text(
              "Track Order",
              style: body_1.copyWith(color: accent_cr),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  print("tapped");
              BlocProvider.of<CartCubit>(context).clearItem();
                Navigator.of(context).pop();
                },
                overlayColor: MaterialStatePropertyAll(Colors.transparent),
                child: Text(
                  "Back to Home",
                  style: body_2.copyWith(
                      color: text_cr, decoration: TextDecoration.underline),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
