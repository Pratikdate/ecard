import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Resource/color_handler.dart';
import 'LayoutScreens/HomepageLayout/ActivitybarLayout.dart';
import 'LayoutScreens/HomepageLayout/AppbarLayout.dart';
import 'LayoutScreens/HomepageLayout/ProgressLayout.dart';
import 'LayoutScreens/HomepageLayout/UserProgressBarLayout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.r,
        leadingWidth: MediaQuery.of(context).size.width,
        backgroundColor: ColorHandler.bgColor,
        leading: const AppbarLayout(),
      ),
      backgroundColor: ColorHandler.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserProgressBarLayout(),
          SizedBox(height: 0.01.sh),
          const ProgressLayout(),
          const ActivitybarLayout(),
        ],
      ),
    );
  }
}

class FadedEdges extends StatelessWidget {
  const FadedEdges({
    Key? key,
    required this.child,
    this.colors,
    this.stops,
    this.isHorizontal = false,
  }) : super(key: key);

  final Widget child;
  final List<Color>? colors;
  final List<double>? stops;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstOut,
      shaderCallback: (Rect rect) => LinearGradient(
        colors: colors ??
            [
              ColorHandler.normalFont.withOpacity(0.60),
              Colors.transparent,
              Colors.transparent,
              ColorHandler.normalFont.withOpacity(0.60),
            ],
        stops: stops ?? const [0.1, 0.25, 0.85, 1.0],
        begin: !isHorizontal ? Alignment.topCenter : Alignment.centerLeft,
        end: !isHorizontal ? Alignment.bottomCenter : Alignment.centerRight,
      ).createShader(rect),
      child: child,
    );
  }
}

class FadingEffect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));
    LinearGradient lg = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(0, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ],
    );
    Paint paint = Paint()..shader = lg.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
