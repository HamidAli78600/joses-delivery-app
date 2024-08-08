import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/view/customer_view/customer_nav_bar.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_secondary_button.dart';
import 'package:joses_delivery_app/widgets/k_text_field_widget.dart';

class EnterManualAddressScreen extends StatelessWidget {
  EnterManualAddressScreen({super.key});

  final AuthController c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        title: Text(
          AppStrings.address,
          style: kTextStyle(
              color: AppColors.secondaryTextColor,
              fontSize: FontDimen.dimen20,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.7
          ),),
        backgroundColor: AppColors.primaryWhiteColor,
        centerTitle: true,
        actions: [
          Text(
            '3/3',
            style: kTextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: FontDimen.dimen20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.7
            ),).paddingOnly(right: mQ.width * 0.08),
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                KTextField(
                    controller: c.enterFirstName,
                    keyboardType: TextInputType.emailAddress,
                    hintText: AppStrings.houseNo,
                    obSecureText: false,
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your house address';
                      }
                      if (value.length < 3) {
                        return 'Please enter maximum three character';
                      }
                      return null;
                    }
                ).paddingOnly(top: mQ.height * 0.04),
                KTextField(
                    controller: c.enterFirstName,
                    keyboardType: TextInputType.emailAddress,
                    hintText: AppStrings.roadName,
                    obSecureText: false,
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your root address';
                      }
                      if (value.length < 3) {
                        return 'Please enter maximum three character name';
                      }
                      return null;
                    }
                ).paddingOnly(top: mQ.height * 0.04),
                Row(
                  children: [
                    Expanded(
                      child: KTextField(
                          controller: c.enterFirstName,
                          keyboardType: TextInputType.emailAddress,
                          hintText: AppStrings.state,
                          obSecureText: false,
                          context: context,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter state';
                            }
                            if (value.length < 3) {
                              return 'max three character';
                            }
                            return null;
                          }
                      ),
                    ),
                    5.width,
                    Expanded(
                      child: KTextField(
                          controller: c.enterFirstName,
                          keyboardType: TextInputType.emailAddress,
                          hintText: AppStrings.city,
                          obSecureText: false,
                          context: context,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please city';
                            }
                            if (value.length < 3) {
                              return 'max three character';
                            }
                            return null;
                          }
                      ),
                    ),
                  ],
                ).paddingOnly(top: mQ.height * 0.04),
                KTextField(
                    controller: c.enterFirstName,
                    keyboardType: TextInputType.emailAddress,
                    hintText: AppStrings.pinCode,
                    obSecureText: false,
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your pin code';
                      }
                      if (value.length < 4) {
                        return 'Please enter maximum four character';
                      }
                      return null;
                    }
                ).paddingOnly(top: mQ.height * 0.04),
              ],

            ),
            kSecondaryButton(
              onTap: () {
                Get.to(()=> CustomerNavBar());
                // if (formKey.currentState!.validate()) {
                //   // await c.loginWithEmail();
                // }
              },
              text: AppStrings.continueText,
              height: mQ.height * 0.08,
              width: mQ.width,
              buttonColor: AppColors.buttonColor,
              textColor: AppColors.primaryTextColor,
              fontSize: FontDimen.dimen18,
              fontWeight: FontWeight.w700,
              borderRadius: 10.0,
            ).paddingOnly(bottom: AppDimens.dimen18),
          ],
        ).paddingSymmetric(horizontal: mQ.width * 0.08),
      ),
    );
  }
}
