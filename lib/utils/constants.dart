import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class AppColors {
  static const Color primaryColor = Color.fromRGBO(244, 245, 0, 1);
  static const Color secondaryColor = Color.fromRGBO(81, 87, 119, 1);
  static const Color primaryWhiteColor = Color.fromRGBO(240, 241, 245, 1);
  static const Color backgroundColor = Color.fromRGBO(63, 61, 86, 1);
  static const Color textColor = Color.fromRGBO(63, 61, 86, 1);
  static const Color primaryTextColor = Color.fromRGBO(244, 245, 0, 1);
  static const Color descriptionLightTextColor = Color.fromRGBO(81, 87, 119, 0.6);

  static const Color hintColor = Color(0xff5E5F62);
  static const Color cardColor = Color(0xff2E2E2E);
  static const Color greenColor = Color(0xFF43DC80);
  static const Color redColor = Color(0xFFDC4343);
  static const Color deviderColor = Color(0xFFB87333);
  static const Color greyColor = Color(0xFF565656);
}

class AppFonts {
  static String sfpRoundedRegular = "sfpDisplayRoundedRegular";
  static String sfpRoundedLight = "sfpDisplayRoundedLight";
  static String sfpRoundedMedium = "sfpDisplayRoundedMedium";
  static String sfpRoundedBold = "sfpDisplayRoundedBold";
  static String sfpRoundedSemiBold = "sfpDisplayRoundedSemiBold";
}

// media query
Size get mQ => MediaQuery.of(Get.context!).size;
// local storage instance
final GetStorage kStorage = GetStorage();
// sized box
extension CustomSizeBox on int {
  SizedBox get height => SizedBox(height: toDouble().h);
  SizedBox get width => SizedBox(width: toDouble().w);
}

// text styles
double primaryFontSize = 12.0.sp;
double secondaryFontSize = 14.0.sp;

//color full print statement
void printWarning(String text) {
  if (kDebugMode) {
    print('\x1B[33m$text\x1B[0m');
  }
}
void printError(String text) {
  if (kDebugMode) {
    print('\x1B[31m$text\x1B[0m');
  }
}

TextStyle kTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
  double? letterSpacing,
  double? height,
  double? wordSpacing,
  String? fontFamily,
}) {
  return TextStyle(
    fontFamily: fontFamily != null ? fontFamily.toString() : AppFonts.sfpRoundedRegular,
    fontSize: fontSize ?? primaryFontSize,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
  );
}