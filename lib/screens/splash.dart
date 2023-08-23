import 'package:decorly/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller_fill;
  late Animation<double> _animation;
  late Animation<double> _animation_fill;

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller_fill =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation = Tween<double>(begin: 264, end: 264).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _animation_fill = Tween<double>(begin: 0, end: 100).animate(CurvedAnimation(
        parent: _controller_fill,
        curve: const Interval(0.40, 0.70, curve: Curves.easeInOut)))
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    _controller_fill.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _controller_fill.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(getWidth(context, 100));
    return Scaffold(
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
                painter: RPSCustomPainter(_animation_fill.value / 25),
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
                      padding: EdgeInsets.all(15),
                      width: getWidth(context, 55),
                      child: SvgPicture.asset('assets/imgs/splash_logo.svg')),
                  SizedBox(height: 6,),
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
    path_0.moveTo(size.width * (0.9840966 + value * 2), size.height * 0.5435406);

    // right top
    path_0.cubicTo(
        size.width * (0.9840966 + value * 2 ),
        size.height * (0.5435406 - value ),
        size.width * (0.8980717 + value * 1.5),
        size.height * (0.1804371 - value ),
        size.width * (0.6841028 + value * 1.5),
        size.height * (0.07082059 - value ));
    // top left
    path_0.cubicTo(
        size.width * (0.4701308 + 0),
        size.height * (-0.03879635 - value1 * 2),
        size.width * (0.3510125 - value1),
        size.height * (-0.01311771 - value1 * 2),
        size.width * (0.2550555 - value1),
        size.height * (0.1273365 - value1 * 2));
    // left top
    path_0.cubicTo(
        size.width * (0.1590994 - value2 * 1.5),
        size.height * (0.2677912 - value2 * 2),
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
        size.height * (0.9683412 + value3 * 2));

    // bot right
    path_0.cubicTo(
        size.width * (0.4833645 - value4),
        size.height * (1.054000 + value4 * 2),
        size.width * (0.5407290 + 0),
        size.height * (0.9066882 + value4 * 2),
        size.width * (0.7282212 + value4),
        size.height * (0.9375059 + value4));

    // right bot
    path_0.cubicTo(
        size.width * (0.9157103 + value5 ),
        size.height * (0.9683176 + value5),
        size.width * (1.039252 + value5 * 1.5 ),
        size.height * (0.8587471 + value5),
        size.width * (0.9840966 + value5 * 2 ),
        size.height * (0.5435406 + value5));
    path_0.close();

    //path_0.cubicTo(
    //     size.width * (0.9840966 + _fill_value),
    //     size.height * (0.5435406 - _fill_value),
    //     size.width * (0.8980717 + _fill_value),
    //     size.height * (0.1804371 - _fill_value),
    //     size.width * (0.6841028 + _fill_value),
    //     size.height * (0.07082059 - _fill_value));
    // // top left
    // path_0.cubicTo(
    //     size.width * (0.4701308 + _fill_value),
    //     size.height * (-0.03879635 - _fill_value),
    //     size.width * (0.3510125 + _fill_value),
    //     size.height * (-0.01311771 - _fill_value),
    //     size.width * (0.2550555 + _fill_value ),
    //     size.height * (0.1273365 - _fill_value));
    // // left top
    // path_0.cubicTo(
    //     size.width * (0.1590994 - _fill_value ),
    //     size.height * (0.2677912 - _fill_value ),
    //     size.width * (0.1249134 - _fill_value ),
    //     size.height * (0.4869312 - _fill_value ),
    //     size.width * (0.05322617 - _fill_value ),
    //     size.height * (0.6034941 - _fill_value ));

    // // left bot
    // path_0.cubicTo(
    //     size.width * ( -0.01846103 - _fill_value),
    //     size.height * ( 0.7200588 + _fill_value),
    //     size.width * ( -0.05927726 - _fill_value),
    //     size.height * ( 0.8826882 + _fill_value),
    //     size.width * ( 0.2120433 - _fill_value),
    //     size.height * ( 0.9683412 + _fill_value) );

    // // bot right
    // path_0.cubicTo(
    //     size.width * ( 0.4833645 + _fill_value),
    //     size.height * ( 1.054000 + _fill_value),
    //     size.width * ( 0.5407290 + _fill_value),
    //     size.height * ( 0.9066882 + _fill_value),
    //     size.width * ( 0.7282212 + _fill_value),
    //     size.height * ( 0.9375059 + _fill_value));

    // // right bot
    // path_0.cubicTo(
    //     size.width * (0.9157103 + _fill_value),
    //     size.height * (0.9683176 + _fill_value),
    //     size.width * (1.039252 + _fill_value),
    //     size.height * (0.8587471 + _fill_value),
    //     size.width * (0.9840966 + _fill_value),
    //     size.height * (0.5435406 + _fill_value));
    // path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = light_primary_cr;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
