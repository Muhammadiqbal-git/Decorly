import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primary_cr = const Color(0xFF317865);
Color light_primary_cr = const Color(0xFFC9D9D2);
Color secondary_cr = const Color(0xFFFFA892);
Color text_cr = const Color(0xFF313131);
Color subtle_text_cr = const Color(0xFF919191);
Color accent_cr = const Color(0xFFEFF1ED);
Color white_cr = const Color(0xFFFFFFFF);

TextStyle apps_name = GoogleFonts.gochiHand(fontSize: 24);
TextStyle display =
    GoogleFonts.rubik(fontSize: 25, fontWeight: FontWeight.w500);
TextStyle title = GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500);
TextStyle desc = GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w400);
TextStyle body_1 = GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w500);
TextStyle body_2 = GoogleFonts.rubik(fontSize: 14, fontWeight: FontWeight.w400);
TextStyle caption_1 =
    GoogleFonts.rubik(fontSize: 13, fontWeight: FontWeight.w400);

/// Return the specific percentage of the screen width
/// Takes [context] and a [size] representing the desired percentage of the screen width.
/// [size] argument must be in range 1-100 whereas 1 for the minimum width pixels and 100 for the maximum.
/// Returns [double] representing the calculated width in logical pixels.
double getWidth(BuildContext context, int size) {
  return MediaQuery.of(context).size.width * (size / 100);
}

/// Return the specific percentage of the screen height
/// Takes [context] and a [size] representing the desired percentage of the screen height.
/// [size] argument must be in range 1-100 whereas 1 for the minimum height pixels and 100 for the maximum.
/// Returns [double] representing the calculated height in logical pixels.
double getHeight(BuildContext context, int size) {
  return MediaQuery.of(context).size.height * (size / 100);
}

double getScreenHeight(double size) {
  print(
      "height ${PlatformDispatcher.instance.views.first.physicalSize.height}");
  print("height ${PlatformDispatcher.instance.views.first.physicalSize.width}");

  return PlatformDispatcher.instance.views.first.physicalSize.width /
      PlatformDispatcher.instance.views.first.physicalSize.height;
}
