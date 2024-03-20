import 'package:decorly/bloc/shop_cubit.dart';
import 'package:decorly/screens/shop_page.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/imgs/cart_empty.svg",
            width: getWidth(40),
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
                  builder: (context) => ShopPage(),
                ));
              },
              colorButton: primary_cr,
              widthButton: getWidth(60),
              heightButton: 48,
              childButton: Text(
                "Shop Now",
                style: body_1.copyWith(color: white_cr),
              ))
        ],
      ),
    );
  }
}
