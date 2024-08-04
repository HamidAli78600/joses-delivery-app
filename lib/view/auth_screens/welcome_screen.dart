import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/storage_helper.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final AuthController c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    String welcomeMessage;
    switch (c.userRole) {
      case 'customer':
        welcomeMessage = 'Welcome back, Customer!';
        break;
      case 'restaurant':
        welcomeMessage = 'Welcome, Restaurant!';
        break;
      case 'rider':
        welcomeMessage = 'Welcome, Rider!';
        break;
      default:
        welcomeMessage = 'Welcome!';
    }

    return Center(
      child: Text(
        welcomeMessage,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
