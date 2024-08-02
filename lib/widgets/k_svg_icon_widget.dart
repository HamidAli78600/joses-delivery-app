import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget showSvgIcon({required String iconPath, bool replacement = false, Widget? page, Function()? onTap}) {
  return GestureDetector(
      onTap: () {
        if(onTap != null){
          onTap();
        }
        if (page != null){
          if(replacement){
            Get.offAll(() => page);
          }else{
            Get.to(() => page);
          }
        }
      },
      child: SvgPicture.asset(iconPath));
}