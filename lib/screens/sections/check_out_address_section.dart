import 'package:decorly/bloc/cart_cubit.dart';
import 'package:decorly/bloc/check_out_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:decorly/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutAddressSection extends StatefulWidget {
  const CheckOutAddressSection({super.key});

  @override
  State<CheckOutAddressSection> createState() => _CheckOutAddressSectionState();
}

class _CheckOutAddressSectionState extends State<CheckOutAddressSection> {
  late TextEditingController street;
  late TextEditingController city;
  late TextEditingController country;
  late TextEditingController zipCode;

  @override
  void initState() {
    // TODO: implement initState
    street = TextEditingController();
    city = TextEditingController();
    country = TextEditingController();
    zipCode = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    street.dispose();
    city.dispose();
    country.dispose();
    zipCode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
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
                textEditingController: street,
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
                          textEditingController: city,
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
                          textEditingController: country,
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
                          textEditingController: zipCode,
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
                  function: () {
                    BlocProvider.of<CheckOutCubit>(context).addressProcess(street.text, city.text, country.text, zipCode.text);
                    BlocProvider.of<CheckOutCubit>(context).nextPage();
                  },
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
    );
  }
}
