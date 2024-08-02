import 'package:flutter/material.dart';

Widget customCircularProgressIndicator({
  double strokeWidth = 4.0,
  Color backgroundColor = Colors.grey,
  Color valueColor = Colors.blue,
  double? value, // Null for an indeterminate progress indicator
}) {
  return CircularProgressIndicator(
    strokeWidth: strokeWidth,
    backgroundColor: backgroundColor,
    valueColor: AlwaysStoppedAnimation<Color>(valueColor),
    value: value,
  );
}