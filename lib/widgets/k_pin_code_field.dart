import 'package:flutter/material.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:pinput/pinput.dart';

Widget pinCodeWidget({
  TextEditingController? pinController,
  FocusNode? focusNode,
  GlobalKey<FormState>? formKey,
  int length = 6,
  double width = 55,
  double height = 55,
  TextStyle? textStyle,
  Color borderColor = AppColors.descriptionLightTextColor,
  Color cursorColor = AppColors.secondaryColor,
  Color submittedColor = AppColors.secondaryColor,
  HapticFeedbackType hapticFeedbackType = HapticFeedbackType.lightImpact,
  String? Function(String?)? validator, // Optional validator parameter
}) {
  final defaultPinTheme = PinTheme(
    width: width,
    height: height,
    textStyle: textStyle ?? kTextStyle(fontSize: FontDimen.dimen22, color: AppColors.secondaryTextColor),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  return Form(
    key: formKey ?? GlobalKey<FormState>(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: length,
            controller: pinController,
            focusNode: focusNode ?? FocusNode(),
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => SizedBox(width: mQ.width * 0.06),
            hapticFeedbackType: hapticFeedbackType,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the OTP';
              }
              if (value.length != 4) {
                return 'OTP must be 4 digits';
              }
              return null;
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 1,
                  height: 30,
                  color: cursorColor,
                ),
              ],
            ),
            followingPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
              ),
            ),
            disabledPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.whiteColor,
                border: Border.all(color: borderColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: submittedColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.secondaryColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
        ),
      ],
    ),
  );
}

