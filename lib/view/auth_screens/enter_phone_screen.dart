import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/view/auth_screens/get_otp_screen.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_secondary_button.dart';
import 'package:joses_delivery_app/widgets/k_text_field_widget.dart';

class EnterPhoneNumberScreen extends StatelessWidget {
  EnterPhoneNumberScreen({super.key});

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
                  Image.asset(AppImages.phoneNumberImage).paddingOnly(top: mQ.height * 0.04),
                  Text(
                    AppStrings.enterPhoneNumber,
                    style: kTextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: FontDimen.dimen24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.9
                    ),
                  ).paddingOnly(top: mQ.height * 0.04),
                  // for restaurant or rider
                  KTextField(
                      controller: c.emailController,
                      keyboardType: TextInputType.phone,
                      hintText: AppStrings.phoneNumber,
                      prefixIcon: CountryCodePicker(
                        onChanged: (e) => c.setSelectedPhone(e.dialCode!),
                        initialSelection: 'IN',
                        showCountryOnly: true,
                        showDropDownButton: true,
                        showFlag: true,
                        showOnlyCountryWhenClosed: true,
                        favorite: const ['+49','+91','+92'],
                        builder: (countryCode) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: mQ.width * 0.04,vertical: mQ.height * 0.024),
                            child: Text(
                              countryCode.toString(),
                              style: kTextStyle(color: AppColors.hintColor,letterSpacing: 0.6, fontSize: FontDimen.dimen18),
                            ),
                          );
                        },
                      ),
                      obSecureText: false,
                      context: context,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!GetUtils.isPhoneNumber(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      }
                  ).paddingOnly(top: mQ.height * 0.045),
                  kSecondaryButton(
                    onTap: () {
                      Get.to(()=>GetOtpScreen());
                      // if (formKey.currentState!.validate()) {
                      // }
                    },
                    text: AppStrings.getOtp,
                    height: mQ.height * 0.08,
                    width: mQ.width,
                    buttonColor: AppColors.buttonColor,
                    textColor: AppColors.primaryTextColor,
                    fontSize: FontDimen.dimen18,
                    fontWeight: FontWeight.w700,
                    borderRadius: 10.0,
                  ).paddingOnly(top: mQ.height * 0.20),
                ],
              ).paddingSymmetric(horizontal: 28.0),
            ),
          ),
        ),
      ),
    );
  }
}