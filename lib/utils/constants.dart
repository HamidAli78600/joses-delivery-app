import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class AppColors {
  static const Color primaryColor = Color(0xffF0EACE);
  static const Color secondaryColor = Color(0xFF181819);
  static const Color terneryColor = Color(0xffB87333);

  static const Color hintColor = Color(0xff5E5F62);
  static const Color cardColor = Color(0xff2E2E2E);
  static const Color greenColor = Color(0xFF43DC80);
  static const Color redColor = Color(0xFFDC4343);
  static const Color deviderColor = Color(0xFFB87333);
  static const Color greyColor = Color(0xFF565656);
}

// media query
Size get mQ => MediaQuery.of(Get.context!).size;
// local storage instance
final GetStorage kStorage = GetStorage();

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
    fontFamily: fontFamily != null ? fontFamily.toString() : 'SFPro',
    fontSize: fontSize != null ? fontSize.sp : primaryFontSize,
    fontWeight: fontWeight ?? FontWeight.w400,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
    wordSpacing: wordSpacing,
  );
}