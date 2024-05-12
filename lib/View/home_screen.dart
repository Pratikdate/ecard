import 'package:Monitor/View/LayoutScreens/HomepageLayout/AppbarLayout.dart';
import 'package:Monitor/View/LayoutScreens/HomepageLayout/ProgressLayout.dart';
import 'package:Monitor/View/LayoutScreens/HomepageLayout/UserProgressBarLayout.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'LayoutScreens/HomepageLayout/ActivitybarLayout.dart';
import 'coreRes/color_handler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}); // Constructor for HomeScreen widget

  static const routeName = "/home"; // Route name for navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Customized app bar
          toolbarHeight: 60.r,
          leadingWidth: MediaQuery.of(context).size.width,
          backgroundColor: ColorHandler.bgColor,
          leading: LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
            return const AppbarLayout();
          })),

      backgroundColor: ColorHandler.bgColor,

      // Body content
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
            return UserProgressBarLayout();
          }),


          SizedBox(height: 0.01.sh), // Spacer

          // Monitoring progress on different platforms
          LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
            return ProgressLayout();
            }
            ),

          // Friends activity section
          LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
                return ActivitybarLayout();
              }
          ),

        ],
      ),
    );
  }
}

class FadedEdges extends StatelessWidget {
  const FadedEdges(
      {super.key,
      required this.child,
      this.colors,
      this.stops,
      this.isHorizontal = false});
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
                      ColorHandler.normalFont.withOpacity(0.60)
                    ],
                stops: stops ?? const [0.1, 0.25, 0.85, 1.0],
                begin:
                    !isHorizontal ? Alignment.topCenter : Alignment.centerLeft,
                end: !isHorizontal
                    ? Alignment.bottomCenter
                    : Alignment.centerRight)
            .createShader(rect),
        child: child);
  }
}

class FadingEffect extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height));
    LinearGradient lg = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          //create 2 white colors, one transparent
          Color.fromARGB(0, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255)
        ]);
    Paint paint = Paint()..shader = lg.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(FadingEffect linePainter) => false;
}
