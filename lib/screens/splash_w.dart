import 'package:decorly/screens/splash.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';

class SplashWaitPage extends StatefulWidget {
  const SplashWaitPage({super.key});

  @override
  State<SplashWaitPage> createState() => _SplashWaitPageState();
}

class _SplashWaitPageState extends State<SplashWaitPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 500),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SplashScreens(),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: white_cr,
    );
  }
}
