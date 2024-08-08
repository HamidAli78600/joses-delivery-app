import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/utils/storage_helper.dart';
import 'package:joses_delivery_app/view/auth_screens/on_boarding_screen.dart';
import 'package:joses_delivery_app/view/customer_view/customer_nav_bar.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigationFunction();
  }

  @override
  void onReady() {
    super.onReady();
    precacheImage(AssetImage(AppImages.splashLogo), Get.context!);
  }

  Future<void> navigationFunction() async {
    await Future.delayed(const Duration(seconds: 4), () {
      if (StorageHelper.userAccessToken == '') {
        Get.offAll(() => OnBoardingScreen());
      } else {
        if(StorageHelper.userRole == 'customer'){
          Get.offAll(() => const CustomerNavBar());
        }
        if(StorageHelper.userRole == 'restaurant'){

        }
        if(StorageHelper.userRole == 'rider'){

        }
      }
    });
  }
}

// RxBool animate = false.obs;
//
// @override
// void onInit() {
//   super.onInit();
//   startAnimation();
// }
//
// void startAnimation() async {
//   await Future.delayed(const Duration(milliseconds: 700), () {
//     animate.value = true;
//   });
//   await Future.delayed(const Duration(milliseconds: 1300), () {
//     if (StorageHelper.userAccessToken == '') {
//       Get.offAll(() => OnBoardingScreen(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 2000));
//     } else {
//       Get.offAll(() => const NavBar(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 2000));
//     }
//   });
//   Get.delete<SplashController>();
// }



