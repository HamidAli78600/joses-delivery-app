import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';

class ChooseUserTypeScreen extends StatelessWidget {
   ChooseUserTypeScreen({super.key});
   final AuthController c = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: Stack(
        children: [
          Container(
            width: mQ.width,
            height: mQ.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.loginBackground),
                fit: BoxFit.fill,
              ),
            ),
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(81, 87, 119, 0),
                  Color.fromRGBO(63, 61, 86, 1),
                ]
              )
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Welcome to \n',
                        style: kTextStyle(
                            color: AppColors.textColor,
                            fontSize: FontDimen.dimen38,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.6
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Jose’s Delivery',
                            style: kTextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: FontDimen.dimen38,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.6
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(top: mQ.height * 0.12),
                    Text(
                      AppStrings.yourFav,
                      style: kTextStyle(
                        color: AppColors.primaryWhiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: FontDimen.dimen16,
                        height: 1.4,
                        letterSpacing: 1.5
                      ),
                    ).paddingOnly(top: mQ.height * 0.02),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.procAs,
                      style: kTextStyle(
                        fontFamily: AppFonts.sfpRoundedBold,
                        color: AppColors.primaryWhiteColor,
                        fontSize: FontDimen.dimen28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: mQ.height * 0.07,
                          width: mQ.width,
                          decoration: BoxDecoration(
                            color: AppColors.primaryWhiteColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.customer,
                                style: kTextStyle(
                                  color: AppColors.primaryWhiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: FontDimen.dimen18,
                                  height: 1.4,
                                  letterSpacing: 1.5
                                ),
                              ).paddingOnly(left: mQ.width * 0.08),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                weight: 0.022,
                              ).paddingOnly(right: mQ.width * 0.08)
                            ],
                          ),
                        ).paddingOnly(bottom: 20),
                      ],
                    )
                  ],
                ).paddingSymmetric(horizontal: 16),
              ],
            ).paddingSymmetric(horizontal: 22),
          ),
        ],
      ),
    );
  }
}
