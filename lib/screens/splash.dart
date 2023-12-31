import 'package:decorly/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreens extends StatefulWidget {
  final double screen_height;
  const SplashScreens({Key? key, required this.screen_height}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller_fill;
  late Animation<double> _animation_fill;

  @override
  void initState() {
    // TODO: implement initState
    _controller_fill =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animation_fill = Tween<double>(begin: 0, end: 1.25).animate(CurvedAnimation(
        parent: _controller_fill,
        curve: const Interval(0.225, 0.95, curve: Curves.easeOutQuart)))
      ..addListener(() {
        setState(() {});
      });
    _controller_fill.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller_fill.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animation_fill.value);
    return Scaffold(
      backgroundColor: white_cr,
      body: Center(
        child: Stack(
          // fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: getHeight(context, 35),
              child: CustomPaint(
                size: Size(
                    getWidth(context, 60), (getWidth(context, 60) * 0.5295950155763239)),
                painter: RPSCustomPainter(_animation_fill.value),
              ),
            ),
            // Container(
            //   color: primary_cr,
            //   width: getWidth(context, 100),
            // ),
            Positioned(
              top: getHeight(context, 35),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(15),
                      width: getWidth(context, 55),
                      child: SvgPicture.asset('assets/imgs/splash_logo.svg')),
                  const SizedBox(height: 6,),
                  Text('Do Decorly', style: apps_name.copyWith(color: white_cr),)
                  
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
  final double _fill_value;

  RPSCustomPainter(this._fill_value);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    // asdasdasdas asdasdasd
    double value = _fill_value;
    double value1 = _fill_value;
    double value2 = _fill_value;
    double value3 = _fill_value;
    double value4 = _fill_value;
    double value5 = _fill_value;
    path_0.moveTo(size.width * (0.9840966 + value * 1.5), size.height * 0.5435406);

    // right top
    path_0.cubicTo(
        size.width * (0.9840966 + value * 1.5 ),
        size.height * (0.5435406 - value * 0.5),
        size.width * (0.8980717 + value * 1.1),
        size.height * (0.1804371 - value ),
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
        size.width * (0.05322617 - value2 * 1.5 ),
        size.height * (0.6034941 - 0));

    // left bot
    path_0.cubicTo(
        size.width * (-0.01846103 - value3 * 1.5),
        size.height * (0.7200588 + value3 * 1),
        size.width * (-0.05927726 - value3 * 2 ),
        size.height * (0.8826882 + value3 * 2),
        size.width * (0.2120433 - value3 * 1.5 ),
        size.height * (0.9683412 + value3 * 2.1));

    // bot right
    path_0.cubicTo(
        size.width * (0.4833645 - value4 * 0.8),
        size.height * (1.054000 + value4 * 2.8),
        size.width * (0.5407290 + value4 * 0.6),
        size.height * (0.9066882 + value4 * 2.4),
        size.width * (0.7282212 + value4 * 1),
        size.height * (0.9375059 + value4 * 1.4));

    // right bot
    path_0.cubicTo(
        size.width * (0.9157103 + value5 * 0.9 ),
        size.height * (0.9683176 + value5 * 0.9),
        size.width * (1.039252 + value5 * 1 ),
        size.height * (0.8587471 + value5 * 0.5),
        size.width * (0.9840966 + value5 * 1.5),
        size.height * (0.5435406 + value5));
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = light_primary_cr;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
