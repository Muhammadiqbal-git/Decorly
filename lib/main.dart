import 'package:decorly/bloc/login_page_cubit.dart';
import 'package:decorly/bloc/onboarding_cubit.dart';
import 'package:decorly/bloc/term_cubit.dart';
import 'package:decorly/screens/login_page.dart';
import 'package:decorly/test_screens.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginPageCubit(),
        ),
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (context) => TermCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Decorly',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatchs below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.red,
            colorScheme: ColorScheme.fromSwatch(accentColor: primary_cr)),
        routes: {
          "/login": (context) => LoginPage(),
        },
        home: const TestScreens(),
      ),
    );
  }
}
