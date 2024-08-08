import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/view/auth_screens/enter_phone_screen.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_primary_button.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_secondary_button.dart';
import 'package:joses_delivery_app/widgets/k_custom_snackbar.dart';
import 'package:joses_delivery_app/widgets/k_text_field_widget.dart';


class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final AuthController c = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Center(
      child: Obx(() {
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
                      Image.asset(AppImages.welcomeImage).paddingOnly(top: mQ.height * 0.04),
                      Text(
                        AppStrings.welcomeBack,
                        style: kTextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: FontDimen.dimen38,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.7
                        ),
                      ).paddingOnly(top: mQ.height * 0.02),
                      c.userRole.value == 'restaurant' || c.userRole.value == 'rider'
                          ? Text(
                        AppStrings.loginToYourAccount,
                        style: kTextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: FontDimen.dimen18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.7
                        ),
                      ).paddingOnly(top: mQ.height * 0.006)
                          : Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.continueWith,
                          style: kTextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: FontDimen.dimen24,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.8
                          ),
                        ),
                      ).paddingOnly(top: mQ.height * 0.08),
                      if(c.userRole.value == 'customer')
                        kAppPrimaryButton(
                          onTap: () {
                            if (c.selectedOption.value == 'phone') {
                              c.selectedOption.value = ''; // Deselect if already selected
                            } else {
                              c.selectedOption.value = 'phone'; // Select the option
                            }
                          },
                          text: AppStrings.phoneNumber,
                          height: mQ.height * 0.08,
                          width: mQ.width,
                          backgroundColor: c.selectedOption.value == 'phone' ? AppColors.secondaryColor.withOpacity(0.08) : AppColors.transparentColor,
                          textStyle: kTextStyle(color: AppColors.secondaryTextColor, fontSize: FontDimen.dimen18, fontWeight: FontWeight.w400,),
                          borderRadius: 10.0,
                          borderColor: AppColors.secondaryColor,
                          borderWidth: 1.0,
                          isIcon: false,
                        ).paddingOnly(top: mQ.height * 0.02),
                      if(c.userRole.value == 'customer')
                        kAppPrimaryButton(
                          onTap: () {
                            if (c.selectedOption.value == 'email') {
                              c.selectedOption.value = ''; // Deselect if already selected
                            } else {
                              c.selectedOption.value = 'email'; // Select the option
                            }
                          },
                          text: AppStrings.emailAddress,
                          height: mQ.height * 0.08,
                          width: mQ.width,
                          backgroundColor: c.selectedOption.value == 'email' ? AppColors.secondaryColor.withOpacity(0.08) : AppColors.transparentColor,
                          textStyle: kTextStyle(color: AppColors.secondaryTextColor, fontSize: FontDimen.dimen18, fontWeight: FontWeight.w400,),
                          borderRadius: 10.0,
                          borderColor: AppColors.secondaryColor,
                          borderWidth: 1.0,
                          isIcon: false,
                        ).paddingOnly(top: mQ.height * 0.01),
                      // for restaurant or rider
                      if(c.userRole.value == 'restaurant' || c.userRole.value == 'rider')
                        KTextField(
                            controller: c.emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: AppStrings.email,
                            obSecureText: false,
                            context: context,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!GetUtils.isEmail(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            }
                        ).paddingOnly(top: c.userRole.value == 'restaurant' || c.userRole.value == 'rider' ? mQ.height * 0.04 : mQ.height * 0.02),
                      if(c.userRole.value == 'restaurant' || c.userRole.value == 'rider')
                        KTextField(
                            controller: c.passwordController,
                            hintText: AppStrings.password,
                            suffixIcon: c.showPassword.value ? Icons.visibility : Icons.visibility_off,
                            obSecureText: c.showPassword.value,
                            suffixOnTap: () {
                              c.togglePassword();
                            },
                            context: context,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            }
                        ).paddingOnly(top: mQ.height * 0.04),
                      if(c.userRole.value == 'restaurant' || c.userRole.value == 'rider')
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // Get.to(()=>ForgetPasswordScreen());
                            },
                            child: Text(
                              AppStrings.forgetPassword,
                              style: kTextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: FontDimen.dimen14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.0,
                              ),
                            ).paddingOnly(top: 10.0),
                          ),
                        ),
                      kSecondaryButton(
                        onTap: () {
                         if( c.userRole.value == 'customer') {
                           if (c.selectedOption.value.isEmpty) {
                             showCustomSnackBar(AppStrings.selectionRequired, AppStrings.chooseAnOption);
                           } else {
                             Get.to(()=>EnterPhoneNumberScreen());
                           }
                         } else {
                           if (formKey.currentState!.validate()) {
                             // await c.loginWithEmail();
                           }
                         }
                        },
                        text: c.userRole.value == 'restaurant' || c.userRole.value == 'rider' ? AppStrings.login : AppStrings.letsGo,
                        height: mQ.height * 0.08,
                        width: mQ.width,
                        buttonColor: AppColors.buttonColor,
                        textColor: AppColors.primaryTextColor,
                        fontSize: FontDimen.dimen18,
                        fontWeight: FontWeight.w700,
                        borderRadius: 10.0,
                      ).paddingOnly(top: mQ.height * 0.04),
                      if(c.userRole.value == 'restaurant' || c.userRole.value == 'rider')
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Don’t have an account?',
                              style: kTextStyle(
                                  color: AppColors.descriptionLightTextColor,
                                  fontSize: FontDimen.dimen14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.6
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Register',
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
                    ],
                  ).paddingSymmetric(horizontal: 28.0),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}