import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary_cr = Color(0xFF317865);
const Color light_primary_cr = Color(0xFFC9D9D2);
const Color secondary_cr = Color(0xFFFFA892);
const Color red_cr = Color(0xFFF84F31);
const Color text_cr = Color(0xFF313131);
const Color subtle_text_cr = Color(0xFF919191);
const Color accent_cr = Color(0xFFEFF1ED);
const Color white_cr = Color(0xFFFFFFFF);

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
double getWidth(num size) {
  return (WidgetsBinding
              .instance.platformDispatcher.views.first.physicalSize.width /
          WidgetsBinding
              .instance.platformDispatcher.views.first.devicePixelRatio) *
      (size / 100);
}

/// Return the specific percentage of the screen height
/// Takes [context] and a [size] representing the desired percentage of the screen height.
/// [size] argument must be in range 1-100 whereas 1 for the minimum height pixels and 100 for the maximum.
/// Returns [double] representing the calculated height in logical pixels.
double getHeight(num size) {
  // return MediaQuery.of(context).size.height * (size / 100);
  return (WidgetsBinding
              .instance.platformDispatcher.views.first.physicalSize.height /
          WidgetsBinding
              .instance.platformDispatcher.views.first.devicePixelRatio) *
      (size / 100);
}

double getScreenRatio(double size) {
  return WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width /
      WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height *
      (size / 100);
}

double gtHeight(BuildContext context, num size) {
  return MediaQuery.of(context).size.height * (size / 100);
}
double gtWidth(BuildContext context, num size) {
  return MediaQuery.of(context).size.width * (size / 100);
}

double gtScreenRatio(BuildContext context , double size){
  return MediaQuery.of(context).size.height / MediaQuery.of(context).size.width * (size/100);
}

class ButtonPainter extends CustomPainter {
  final Color color;
  final double opacity;
  ButtonPainter({
    required this.color,
    this.opacity = 1.0,
  });
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    Path path_0 = Path();
    path_0.moveTo(0, 12);
    path_0.cubicTo(0, 5, 5, 0, 12, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height - 12);
    path_0.cubicTo(size.width, size.height - 5, size.width - 5, size.height,
        size.width - 12, size.height);
    path_0.lineTo(0, size.height);

    path_0.close();

    if (color != Colors.transparent) {
      Paint paint0Fill = Paint()..style = PaintingStyle.fill;
      paint0Fill.strokeWidth = 1.0;
      paint0Fill.color = color.withOpacity(opacity);
      canvas.drawPath(path_0, paint0Fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
