import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/constants.dart';

Widget kAppPrimaryButton({
  required String text,
  required VoidCallback onTap,
  Color? backgroundColor,
  TextStyle? textStyle,
  IconData? icon,
  double? height,
  double? width,
  double? borderRadius,
  EdgeInsets? padding,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height ?? gH * 0.07,
      width: width ?? gW,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryWhiteColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: textStyle ??
                kTextStyle(
                  color: AppColors.primaryWhiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: FontDimen.dimen18,
                  height: 1.4,
                  letterSpacing: 1.5,
                ),
          ).paddingOnly(left: padding?.left ?? mQ.width * 0.08),
          Icon(
            icon ?? Icons.arrow_forward_ios,
            size: 16,
          ).paddingOnly(right: padding?.right ?? mQ.width * 0.08)
        ],
      ),
    ).paddingOnly(bottom: padding?.bottom ?? 20.0),
  );
}
