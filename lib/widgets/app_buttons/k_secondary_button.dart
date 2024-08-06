import 'package:flutter/material.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/constants.dart';

Widget kSecondaryButton({
  required VoidCallback onTap,
  required String text,
  double? height,
  double? width,
  Color? buttonColor,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
  double? borderRadius,
  EdgeInsetsGeometry? padding,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor ?? AppColors.buttonColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
      ),
      child: Center(
        child: Text(
          text,
          style: kTextStyle(
            color: textColor ?? AppColors.primaryTextColor,
            fontSize: fontSize ?? FontDimen.dimen18,
            fontWeight: fontWeight ?? FontWeight.w700,
            letterSpacing: 0.4
          ),
        ),
      ),
    ),
  );
}
