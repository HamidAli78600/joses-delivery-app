import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/view/auth_screens/enter_manual_address_screen.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_primary_button.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_secondary_button.dart';
import 'package:joses_delivery_app/widgets/k_svg_icon_widget.dart';
import 'package:joses_delivery_app/widgets/k_text_field_widget.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: SizedBox(
        width: mQ.width,
        height: mQ.height,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    width: mQ.width,
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        image: DecorationImage(image: AssetImage(AppImages.locationImage),fit: BoxFit.cover)
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: mQ.width,
                    color: AppColors.primaryWhiteColor,
                    child: Column(
                      children: [
                        kAppPrimaryButton(
                          onTap: () {
                            Get.to(()=> EnterManualAddressScreen());
                          },
                          text: AppStrings.enterCompleteAddress,
                          textStyle: kTextStyle(
                            fontSize: 16,
                            color: AppColors.secondaryColor,
                          ),
                          icon: Icons.arrow_forward_ios,
                          iconColor: AppColors.secondaryColor,
                          padding: EdgeInsets.symmetric(horizontal: mQ.width * 0.02),
                        ).paddingOnly(top: AppDimens.dimen18),
                        kSecondaryButton(
                          onTap: () {

                          },
                          text: AppStrings.continueText,
                          height: mQ.height * 0.08,
                          width: mQ.width,
                          buttonColor: AppColors.buttonColor,
                          textColor: AppColors.primaryTextColor,
                          fontSize: FontDimen.dimen18,
                          fontWeight: FontWeight.w700,
                          borderRadius: 10.0,
                        ).paddingOnly(top: AppDimens.dimen18),
                      ],
                    ),
                  ).paddingSymmetric(horizontal:mQ.width * 0.08),
                ),
              ],
            ),
            // App bar
            SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back,size: 25,color: AppColors.secondaryColor),
                      ),
                      Text(
                        AppStrings.address,
                        style: kTextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: FontDimen.dimen20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.7
                        ),
                      ),
                      Text(
                        '3/3',
                        style: kTextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: FontDimen.dimen20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.7
                        ),),
                    ],
                  ).paddingOnly(top: mQ.height * 0.02,right: mQ.width * 0.08,left: mQ.width * 0.02,),
                  Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0.0, 2.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          )
                        ]
                    ),
                    child: KTextField(
                      textFieldBgColor: AppColors.whiteColor.withOpacity(0.90),
                      hintText: AppStrings.searchLocation,
                      hintStyle: TextStyle(color: AppColors.hintColor,letterSpacing: 1.2, fontSize: FontDimen.dimen18),
                      borderColor: Colors.transparent,
                      prefixIcon: showSvgIcon(iconPath: AppIcons.searchIcon).paddingSymmetric(horizontal: 30),
                      keyboardType: TextInputType.text,
                      context: context,
                    ),
                  ).paddingOnly(top: mQ.height * 0.02,left: mQ.width * 0.08,right: mQ.width * 0.08),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
