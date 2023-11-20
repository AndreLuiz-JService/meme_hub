import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get screenWidth => size.width;
  double get screenHeight => size.height;
  double get screenShortestSide => size.shortestSide;
  double get screenLongestSide => size.longestSide;

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;
}
