import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/constants.dart';

class AppTheme {
  static final dark = ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.secondaryColor,
      iconTheme: const IconThemeData(color: AppColors.terneryColor),
      cardColor: AppColors.cardColor,
      hintColor: AppColors.hintColor,
      dividerColor: AppColors.deviderColor,
      textTheme: TextTheme(
        displayLarge: getTextStyle(AppColors.primaryColor, FontDimen.dimen24,
            fontWeight: FontWeight.w700),
        displayMedium: getTextStyle(AppColors.secondaryColor, FontDimen.dimen18,
            fontWeight: FontWeight.w700),
        displaySmall: getTextStyle(AppColors.terneryColor, FontDimen.dimen20,
            fontWeight: FontWeight.w700),
        headlineLarge: getTextStyle(
          AppColors.terneryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen18,
        ),
        headlineMedium: getTextStyle(
          AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen18,
        ),
        headlineSmall: getTextStyle(
          AppColors.terneryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        titleLarge: getTextStyle(
          AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        titleMedium: getTextStyle(
          AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        titleSmall: getTextStyle(
          AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen14,
        ),
        labelLarge: getTextStyle(
          AppColors.hintColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        labelMedium: getTextStyle(
          AppColors.terneryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen14,
        ),
        labelSmall: getTextStyle(AppColors.primaryColor, FontDimen.dimen16,
            fontWeight: FontWeight.w700),
        bodyLarge: getTextStyle(
          AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen12,
        ),
        bodyMedium: getTextStyle(
          AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen10,
        ),
        bodySmall: getTextStyle(
          AppColors.greyColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen12,
        ),
      ));

  static final light = ThemeData.light().copyWith(
      primaryColor: AppColors.secondaryColor,
      scaffoldBackgroundColor: AppColors.primaryColor,
      iconTheme: const IconThemeData(color: AppColors.terneryColor),
      cardColor: AppColors.terneryColor.withOpacity(0.1),
      hintColor: AppColors.hintColor,
      dividerColor: AppColors.deviderColor,
      textTheme: TextTheme(
        displayLarge: getTextStyle(AppColors.secondaryColor, FontDimen.dimen18,
            fontWeight: FontWeight.w700),
        displayMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen18,
            fontWeight: FontWeight.w700),
        displaySmall: getTextStyle(AppColors.terneryColor, FontDimen.dimen20,
            fontWeight: FontWeight.w700),
        headlineLarge: getTextStyle(
          AppColors.terneryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen18,
        ),
        headlineMedium: getTextStyle(
          AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen18,
        ),
        headlineSmall: getTextStyle(
          AppColors.terneryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        titleLarge: getTextStyle(
          AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        titleMedium: getTextStyle(
          AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        titleSmall: getTextStyle(
          AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen14,
        ),
        labelLarge: getTextStyle(
          AppColors.hintColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen16,
        ),
        labelMedium: getTextStyle(
          AppColors.terneryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen14,
        ),
        labelSmall: getTextStyle(AppColors.secondaryColor, FontDimen.dimen16,
            fontWeight: FontWeight.w700),
        bodyLarge: getTextStyle(
          AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen12,
        ),
        bodyMedium: getTextStyle(
          AppColors.secondaryColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen10,
        ),
        bodySmall: getTextStyle(
          AppColors.greyColor,
          fontWeight: FontWeight.w400,
          FontDimen.dimen12,
        ),
      ));
}

TextStyle getTextStyle(Color color, double size,
        {FontWeight? fontWeight, String? fontFamily}) =>
    GoogleFonts.prozaLibre(
      textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 1.2,
          letterSpacing: 0.30),
    );
