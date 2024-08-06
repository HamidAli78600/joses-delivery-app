import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/utils/storage_helper.dart';
import 'package:joses_delivery_app/view/auth_screens/choose_user_type_screen.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    userRole.value = StorageHelper.userRole;
    precacheImage(AssetImage(AppImages.onBoardingOneImage), Get.context!);
    precacheImage(AssetImage(AppImages.onBoardingTwoImage), Get.context!);
    precacheImage(AssetImage(AppImages.loginBackground), Get.context!);
  }
  // on boarding ..............
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      Get.offAll(ChooseUserTypeScreen());
    }
  }

  void skipOnboarding() {
    Get.offAll(ChooseUserTypeScreen());
  }

  //........................

  // choose user roole screen for role selection

  var userRole = ''.obs; // Reactive RxString
  void updateUserRole(String role) {
    userRole.value = role;
    printWarning("1 check update of role: ${userRole.value}");
  }

  // .........................

  // welcome screen
  // if user as a customer role
  RxString selectedOption = ''.obs;
  // .................
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool showPassword = true.obs;
  void togglePassword() {
    showPassword.value = !showPassword.value;
    update();
  }

  // .........................
}
