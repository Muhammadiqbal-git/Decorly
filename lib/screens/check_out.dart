import 'package:decorly/bloc/cart_cubit.dart';
import 'package:decorly/bloc/check_out_cubit.dart';
import 'package:decorly/screens/sections/check_out_address_section.dart';
import 'package:decorly/screens/sections/check_out_done_section.dart';
import 'package:decorly/screens/sections/check_out_payment_section.dart';
import 'package:decorly/screens/sections/check_out_process_section.dart';
import 'package:decorly/screens/sections/check_out_review_section.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_card.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late PageController _pageController;
  late int page;

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
    print("checkout built");
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
          const CheckOutProcessWidget(),
          //CONTENT
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                FocusScope.of(context).unfocus();
                BlocProvider.of<CheckOutCubit>(context)
                    .updateIndexProgress(value);
              },
              controller:
                  BlocProvider.of<CheckOutCubit>(context).pageController,
              children: const [
                CheckOutAddressSection(),
                CheckOutPaymentSection(),
                CheckOutReviewSection(),
                CheckOutDoneSection()
              ],
            ),
          )
        ],
      ),
    );
  }
}
