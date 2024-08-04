import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final AuthController c = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: SizedBox(
        child: Stack(
          children: [
            PageView(
              pageSnapping: GetPlatform.isMobile,
              controller: c.pageController,
              onPageChanged: c.onPageChanged,
              children: [
                _buildPage(
                  image: AppImages.onBoardingOneImage,
                  title: AppStrings.onBoardingOneTile,
                  description: AppStrings.onBoardingOneDescription,
                ),
                _buildPage(
                  image: AppImages.onBoardingTwoImage,
                  title: AppStrings.onBoardingTwoTile,
                  description: AppStrings.onBoardingTwoDescription,
                ),
              ],
            ),
            Positioned(
              bottom: GetPlatform.isIOS ? 65 : 52,
              child: SizedBox(
                width: mQ.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: c.nextPage,
                      child: Text(
                        AppStrings.next,
                        style: kTextStyle(
                            fontFamily: AppFonts.sfpRoundedRegular,
                            color: AppColors.descriptionLightTextColor,
                            fontSize: FontDimen.dimen16,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                        maxLines: 5,
                      ),
                    ),
                    Obx(() => Row(
                      children: [
                        for (int i = 0; i < 2; i++)
                          Container(
                            width: c.currentPage.value == i ? 38 : 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: c.currentPage.value == i ? Colors.black : Colors.black.withOpacity(0.5),
                            ),
                          ),
                      ],
                    )),
                    GestureDetector(
                      onTap: c.skipOnboarding,
                      child: Text(
                        AppStrings.skip,
                        style: kTextStyle(
                            fontFamily: AppFonts.sfpRoundedRegular,
                            color: AppColors.descriptionLightTextColor,
                            fontSize: FontDimen.dimen16,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required String image, required String title, required String description}) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: mQ.height / 3.5,
            fit: BoxFit.fitWidth,
          ).paddingOnly(top: mQ.height * 0.12),
          Column(
            children: [
              Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: kTextStyle(
                    fontFamily: AppFonts.sfpRoundedRegular,
                    color: AppColors.textColor,
                    fontSize: FontDimen.dimen32,
                    height: mQ.height * 0.0015,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: AppDimens.dimen24),
              Text(
                description,
                style: kTextStyle(
                    fontFamily: AppFonts.sfpRoundedRegular,
                    color: AppColors.descriptionLightTextColor,
                    fontSize: FontDimen.dimen20,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
            ],
          ).paddingSymmetric(horizontal: 20.0, vertical: mQ.height * 0.10),
        ],
      ),
    );
  }
}