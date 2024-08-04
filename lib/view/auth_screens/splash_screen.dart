import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/splash_controller.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController c = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        // duration: const Duration(milliseconds: 2000),
        // curve: Curves.fastLinearToSlowEaseIn,
        height: mQ.height,
        width: mQ.width,
        //width: c.animate.value ? mQ.width : 0,
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
        ),
        child: Stack(
          children: [
            Center(child: Image.asset(AppImages.splashLogo, fit: BoxFit.cover)),
            Column(
              children: [
                Expanded(child: Image.asset(AppImages.splashTopFrame)),
                Expanded(child: Image.asset(AppImages.splashBottomFrame)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
