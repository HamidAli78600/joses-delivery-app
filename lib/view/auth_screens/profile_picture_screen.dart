import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_secondary_button.dart';
import 'package:joses_delivery_app/widgets/k_svg_icon_widget.dart';


class ProfilePictureScreen extends StatelessWidget {
  ProfilePictureScreen({super.key});

  final AuthController c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        title: Text(
          AppStrings.profilePicture,
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
            '2/3',
            style: kTextStyle(
                color: AppColors.secondaryTextColor,
                fontSize: FontDimen.dimen20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.7
            ),).paddingOnly(right: mQ.width * 0.08),
        ],
      ),
      body: SizedBox(
        width: mQ.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: mQ.height * 0.22,
              width: mQ.width * 0.6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
                // image: DecorationImage(
                //
                // ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: AppColors.secondaryColor,
                  radius: 20,
                  child: showSvgIcon(
                    onTap: (){},
                    iconPath: AppIcons.cameraIcon,
                  ),
                ),
              ).paddingOnly(right: mQ.width * 0.12),
            ).paddingOnly(top: mQ.height * 0.04),
            kSecondaryButton(
              onTap: () {

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
            ).paddingOnly(top: mQ.height * 0.06),
          ],
        ).paddingSymmetric(horizontal: 28.0),
      ),
    );

  }
}