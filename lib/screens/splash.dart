import 'package:decorly/screens/onboarding.dart';
import 'package:decorly/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerFill;
  late Animation<double> _animationFill;
  late Animation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _controllerFill = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animationFill = Tween<double>(begin: 0, end: (1.10 + getScreenRatio(100)))
        .animate(CurvedAnimation(
            parent: _controllerFill,
            curve: const Interval(0.4, 0.90, curve: Curves.easeOutQuart)))
      ..addListener(() {
        setState(() {});
      });
    _animationFill.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    OnBoardingIndicator(),
                transitionDuration: const Duration(seconds: 1),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                          opacity: animation,
                          child: child,
                        )));
      }
    });
    _color = ColorTween(begin: light_primary_cr, end: primary_cr).animate(
      CurvedAnimation(
        parent: _controllerFill,
        curve: const Interval(0.70, 0.85, curve: Curves.easeInCirc),
      ),
    )..addListener(() {
        setState(() {});
      });
    _controllerFill.forward();
  }

  @override
  void dispose() {
    _controllerFill.dispose();
    _color.removeListener(() {});
    _animationFill.removeListener(() { });
    _animationFill.removeStatusListener((status) { });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_cr,
      body: Center(
        child: Stack(
          // fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: getHeight(35),
              child: CustomPaint(
                size: Size(gtWidth(context, 60),
                    (gtWidth(context, 60) * 0.5295950155763239)),
                painter: RPSCustomPainter(_animationFill.value),
              ),
            ),
            Positioned(
              top: getHeight(35),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(15),
                      width: gtWidth(context, 55),
                      child: SvgPicture.asset('assets/imgs/splash_logo.svg')),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'DO - Decorly',
                    style: apps_name.copyWith(
                        color: (_controllerFill.value >= 0.7
                            ? _color.value
                            : Colors.transparent)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final double _fillValue;

  RPSCustomPainter(this._fillValue);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    // asdasdasdas asdasdasd
    double value = _fillValue;
    double value1 = _fillValue;
    double value2 = _fillValue;
    double value3 = _fillValue;
    double value4 = _fillValue;
    double value5 = _fillValue;
    path_0.moveTo(
        size.width * (0.9840966 + value * 1.5), size.height * 0.5435406);

    // right top
    path_0.cubicTo(
        size.width * (0.9840966 + value * 1.5),
        size.height * (0.5435406 - value * 0.5),
        size.width * (0.8980717 + value * 1.1),
        size.height * (0.1804371 - value),
        size.width * (0.6841028 + value * 1.4),
        size.height * (0.07082059 - value * 0.9));
    // top left
    path_0.cubicTo(
        size.width * (0.4701308 + value1 * 0.5),
        size.height * (-0.03879635 - value1 * 2),
        size.width * (0.3510125 - value1 * 0.2),
        size.height * (-0.01311771 - value1 * 2),
        size.width * (0.2550555 - value1 * 0.2),
        size.height * (0.1273365 - value1 * 2.2));
    // left top
    path_0.cubicTo(
        size.width * (0.1590994 - value2 * 0.7),
        size.height * (0.2677912 - value2 * 2.3),
        size.width * (0.1249134 - value2 * 1.5),
        size.height * (0.4869312 - value2 * 2),
        size.width * (0.05322617 - value2 * 1.5),
        size.height * (0.6034941 - 0));

    // left bot
    path_0.cubicTo(
        size.width * (-0.01846103 - value3 * 1.5),
        size.height * (0.7200588 + value3 * 1),
        size.width * (-0.05927726 - value3 * 2),
        size.height * (0.8826882 + value3 * 2),
        size.width * (0.2120433 - value3 * 1.5),
        size.height * (0.9683412 + value3 * 2.1));

    // bot right
    path_0.cubicTo(
        size.width * (0.4833645 - value4 * 1),
        size.height * (1.054000 + value4 * 2.8),
        size.width * (0.5407290 + value4 * 0.8),
        size.height * (0.9066882 + value4 * 2.2),
        size.width * (0.7282212 + value4 * 1.2),
        size.height * (0.9375059 + value4 * 1.8));

    // right bot
    path_0.cubicTo(
        size.width * (0.9157103 + value5 * 1.1),
        size.height * (0.9683176 + value5 * 1.4),
        size.width * (1.039252 + value5 * 1),
        size.height * (0.8587471 + value5 * 0.5),
        size.width * (0.9840966 + value5 * 1.5),
        size.height * (0.5435406 + value5));
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = light_primary_cr;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
