import 'package:get/get.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
    colorText: Colors.black,
    icon: const Icon(Icons.warning, color: Colors.black),
    margin: const EdgeInsets.all(16.0),
    duration: const Duration(seconds: 3),
  );
}
