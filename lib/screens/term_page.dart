import 'package:decorly/bloc/term_cubit.dart';
import 'package:decorly/theme.dart';
import 'package:decorly/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white_cr,
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              BlocProvider.of<TermCubit>(context).changeState(false);
              Navigator.of(context).pop();
            },
            icon: const ImageIcon(
              AssetImage("assets/imgs/back_arrow.png"),
              color: text_cr,
            )),
        title: Text(
          "Terms & Conditions",
          style: body_1.copyWith(color: text_cr),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SvgPicture.asset("assets/imgs/terms.svg"),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra elit etiam risus mattis at sit eget accumsan imperdiet. Sit ac etiam diam maecenas volutpat imperdiet morbi mauris faucibus. \n\nInteger arcu tellus in sodales neque nunc aliquet. Habitasse nibh nec morbi mi. Ut tincidunt ut nisl a, mauris amet. Urna morbi purus, nibh viverra. Cursus in commodo sit penatibus proin morbi.",
                style: body_2.copyWith(fontSize: 16, color: text_cr),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  BlocBuilder<TermCubit, TermState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 16,
                        width: 16,
                        child: Checkbox(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          value: state.value,
                          onChanged: (value) {
                            BlocProvider.of<TermCubit>(context)
                                .changeState(!state.value);
                            ScaffoldMessenger.of(context).clearSnackBars();
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "I've read all Terms and Conditions",
                    style: body_2.copyWith(fontSize: 13, color: text_cr),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      function: () {
                        BlocProvider.of<TermCubit>(context).changeState(false);
                        Navigator.of(context).pop();
                      },
                      colorButton: Colors.transparent,
                      borderColor: secondary_cr,
                      heightButton: 48,
                      widthButton: 130,
                      childButton: Text(
                        "Cancel",
                        style: body_1.copyWith(color: secondary_cr),
                      )),
                  SizedBox(
                    width: 30 + getWidth(3),
                  ),
                  BlocBuilder<TermCubit, TermState>(
                    builder: (context, state) {
                      return CustomButton(
                          function: () {
                            if (state.value) {
                              Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Please read and accept the Terms & Conditions!"),
                                      duration: Duration(seconds: 2),
                                    ),
                                  )
                                  .closed
                                  .then((value) => ScaffoldMessenger.of(context)
                                      .clearSnackBars());
                            }
                          },
                          colorButton:
                              state.value ? primary_cr : subtle_text_cr,
                          borderColor:
                              state.value ? primary_cr : subtle_text_cr,
                          heightButton: 48,
                          widthButton: 130,
                          childButton: Text(
                            "Agree",
                            style: body_1.copyWith(
                                color: state.value ? white_cr : white_cr),
                          ));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
