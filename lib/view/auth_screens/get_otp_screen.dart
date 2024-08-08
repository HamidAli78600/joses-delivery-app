import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/view/auth_screens/enter_user_name_screen.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_secondary_button.dart';
import 'package:joses_delivery_app/widgets/k_pin_code_field.dart';
import 'package:pinput/pinput.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});

  final AuthController c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: mQ.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.getOtpImage).paddingOnly(top: mQ.height * 0.04),
                  Text(
                    AppStrings.otpVerification,
                    style: kTextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: FontDimen.dimen24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.9
                    ),
                  ).paddingOnly(top: mQ.height * 0.04),
                  Text(
                    "${AppStrings.otpVerification} +91-123-45-6789",
                    style: kTextStyle(
                        color: AppColors.descriptionLightTextColor,
                        fontSize: FontDimen.dimen14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.9
                    ),
                  ).paddingOnly(top: mQ.height * 0.02),
                  pinCodeWidget(
                    pinController: c.otpController, // Optional
                    focusNode: FocusNode(), // Optional
                    formKey: GlobalKey<FormState>(), // Optional
                    length: 4, // Optional
                    width: mQ.width * 0.4, // Optional
                    height: mQ.width * 0.18, // Optional
                    textStyle: kTextStyle(fontSize: FontDimen.dimen24, color: Colors.black), // Optional
                    borderColor: AppColors.secondaryColor, // Optional
                    cursorColor: AppColors.secondaryColor, // Optional
                    submittedColor: AppColors.whiteColor, // Optional
                    hapticFeedbackType: HapticFeedbackType.mediumImpact, // Optional
                  ).paddingOnly(top: mQ.height * 0.04),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't receive the OTP? ",
                        style: kTextStyle(
                            color: AppColors.descriptionLightTextColor,
                            fontSize: FontDimen.dimen14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.6
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'RESEND OTP',
                            style: kTextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: FontDimen.dimen14,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.6
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: mQ.height * 0.06),
                  ),
                  kSecondaryButton(
                    onTap: () {
                      Get.to(()=>EnterUserNameScreen());
                      // if (formKey.currentState!.validate()) {
                      //   Get.offAll(EnterUserNameScreen());
                      // }
                    },
                    text: AppStrings.verify,
                    height: mQ.height * 0.08,
                    width: mQ.width,
                    buttonColor: AppColors.buttonColor,
                    textColor: AppColors.primaryTextColor,
                    fontSize: FontDimen.dimen18,
                    fontWeight: FontWeight.w700,
                    borderRadius: 10.0,
                  ).paddingOnly(top: mQ.height * 0.08),
                ],
              ).paddingSymmetric(horizontal: 28.0),
            ),
          ),
        ),
      ),
    );
  }
}