import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/view/auth_screens/location_selection_screen.dart';
import 'package:joses_delivery_app/widgets/app_buttons/k_secondary_button.dart';
import 'package:joses_delivery_app/widgets/k_svg_icon_widget.dart';


class ProfilePictureScreen extends StatelessWidget {
  ProfilePictureScreen({super.key});

  final AuthController c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                  image: c.selectedImagePath.value.isNotEmpty
                      ? DecorationImage(
                    image: FileImage(File(c.selectedImagePath.value)),
                    fit: BoxFit.cover,
                  )
                      : DecorationImage(
                    image: AssetImage(AppImages.profilePicture),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                       c.pickImage(ImageSource.gallery);
                      // showModalBottomSheet(
                      //   backgroundColor: AppColors.darkGray,
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return Column(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: <Widget>[
                      //         ListTile(
                      //           horizontalTitleGap: 5,
                      //           leading: Icon(Icons.photo_library, size: 16,color: AppColors.whiteColor),
                      //           title:  Text('Gallery',style: kTextStyle(color: AppColors.whiteColor),),
                      //           onTap: () async {
                      //             Navigator.pop(context);
                      //             await c.pikImage(context: context, imageSource: ImageSource.gallery);
                      //           },
                      //         ),
                      //         ListTile(
                      //           horizontalTitleGap: 5,
                      //           leading:  const Icon(Icons.camera_alt, size: 18,color: AppColors.whiteColor),
                      //           title: Text('Camera', style: kTextStyle(fontSize:  FontDimen.dimen14,color: AppColors.whiteColor)),
                      //           onTap: () async {
                      //             Navigator.pop(context);
                      //             await c.pikImage(context: context, imageSource: ImageSource.camera);
                      //           },
                      //         ),
                      //       ],
                      //     ).paddingSymmetric(horizontal: mQ.width * 0.05);
                      //   },
                      // );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      // radius: 23,
                      child: showSvgIcon(
                        iconPath: AppIcons.cameraIcon,
                      ).paddingAll(8.0),
                    ),
                  ),
                ).paddingOnly(right: mQ.width * 0.12),
              ).paddingOnly(top: mQ.height * 0.04),
              kSecondaryButton(
                onTap: () {
                  Get.to(()=>const LocationSelectionScreen());
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
      ),
    );
  }
}