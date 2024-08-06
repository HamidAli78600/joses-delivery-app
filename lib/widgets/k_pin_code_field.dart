import 'package:flutter/material.dart';
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
}) {
  final defaultPinTheme = PinTheme(
    width: width,
    height: height,
    textStyle: textStyle ?? kTextStyle(fontSize: 22, color: AppColors.secondaryTextColor),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
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
            separatorBuilder: (index) => SizedBox(width: 2),
            hapticFeedbackType: hapticFeedbackType,
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
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: borderColor),
              ),
            ),
            disabledPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: borderColor),
              ),
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: borderColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: submittedColor,
                borderRadius: BorderRadius.circular(19),
                border: Border.all(color: Colors.transparent),
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
