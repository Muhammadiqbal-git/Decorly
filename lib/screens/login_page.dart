import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: getHeight(context, 8),
              ),
              SvgPicture.asset('assets/imgs/logo.svg'),
              const SizedBox(
                height: 4,
              ),
              Text(
                "DO - Decorly",
                style: apps_name.copyWith(color: primary_cr, fontSize: 18),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Sign In",
                          style: body_1.copyWith(color: primary_cr)),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 5,
                          width: 63,
                          decoration: BoxDecoration(
                              color: primary_cr,
                              borderRadius: BorderRadius.circular(6))),
                    ],
                  ),
                  const SizedBox(
                    width: 77,
                  ),
                  Column(
                    children: [
                      Text(
                        "Sign Out",
                        style: body_1.copyWith(color: primary_cr),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 5,
                          width: 63,
                          decoration: BoxDecoration(
                              color: primary_cr,
                              borderRadius: BorderRadius.circular(6))),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back \nYou've been missed!",
                      style: body_1,
                    ),
                    SizedBox(height: 30,),
                    Text("Email", style: body_2,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
