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


class EnterUserNameScreen extends StatelessWidget {
  EnterUserNameScreen({super.key});

  final AuthController c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          title: Text(
            AppStrings.appBarTitle,
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
              '1/3',
              style: kTextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: FontDimen.dimen20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.7
              ),).paddingOnly(right: mQ.width * 0.08),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: mQ.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    KTextField(
                        controller: c.enterFirstName,
                        keyboardType: TextInputType.emailAddress,
                        hintText: AppStrings.firstName,
                        obSecureText: false,
                        context: context,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          if (value.length < 3) {
                            return 'Please enter maximum three character name';
                          }
                          return null;
                        }
                    ).paddingOnly(top: mQ.height * 0.04),
                  KTextField(
                      controller: c.enterLastName,
                      keyboardType: TextInputType.name,
                      hintText: AppStrings.lastName,
                      obSecureText: false,
                      context: context,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        if (value.length < 3) {
                          return 'Please enter maximum three character name';
                        }
                        return null;
                      }
                  ).paddingOnly(top: mQ.height * 0.03),
                  kSecondaryButton(
                    onTap: () {

                      // if (formKey.currentState!.validate()) {
                      //   // await c.loginWithEmail();
                      // }
                    },
                    text: c.userRole.value == 'restaurant' || c.userRole.value == 'rider' ? AppStrings.login : AppStrings.letsGo,
                    height: mQ.height * 0.08,
                    width: mQ.width,
                    buttonColor: AppColors.buttonColor,
                    textColor: AppColors.primaryTextColor,
                    fontSize: FontDimen.dimen18,
                    fontWeight: FontWeight.w700,
                    borderRadius: 10.0,
                  ).paddingOnly(top: mQ.height * 0.06),
                ],
              ).paddingSymmetric(horizontal: 28.0),
            ),
          ),
        ),
      );

  }
}