import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/services/dependency_injection.dart';
import 'dart:io';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/app_strings.dart';
import 'package:joses_delivery_app/utils/app_theme.dart';
import 'package:joses_delivery_app/utils/storage_helper.dart';
import 'package:joses_delivery_app/view/auth_screens/splash_screen.dart';

void main() {
  DependencyInjection.init();
  runApp(DevicePreview(builder: (BuildContext context)=> const MyApp()));

  // runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: StorageHelper().isDark == null
          ? ThemeMode.system
          : (StorageHelper().isDark ?? Get.isDarkMode)
          ? ThemeMode.dark
          : ThemeMode.light,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(FontDimen.textScaleFactor)),
          child: SafeArea(
            top: false,
            bottom: Platform.isIOS ? false : true,
            child: child!,
          ),
        );
      },
      home: SplashScreen(),
    );
  }
}
