import 'package:decorly/screens/onboarding.dart';
import 'package:decorly/screens/splash.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreens extends StatelessWidget {
  const TestScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreens(screen_height: getHeight(context, 100),);
  }
}