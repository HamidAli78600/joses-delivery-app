import 'package:flutter/material.dart';
import 'package:joses_delivery_app/utils/app_dimen.dart';
import 'package:joses_delivery_app/utils/constants.dart';

class KTextField extends StatelessWidget {
  final BuildContext context;
  final String? hintText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final Function()? suffixOnTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obSecureText;

  const KTextField({super.key,
    required this.context,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.controller,
    this.obSecureText,
    this.suffixOnTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColors.secondaryColor,
      cursorRadius: const Radius.circular(20.0),
      cursorWidth: 3.0,
      maxLines: 1,
      style: kTextStyle(color: AppColors.secondaryTextColor, letterSpacing: 0.6, fontSize: FontDimen.dimen18),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: obSecureText ?? true,
      onTapOutside: (event) {FocusScope.of(context).unfocus();},
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
            color: AppColors.hideIconColor,
          ),
          onPressed: suffixOnTap,
        )
            : null,
        contentPadding: EdgeInsets.symmetric(horizontal: mQ.width * 0.08,vertical: mQ.height * 0.024),
        hintStyle: kTextStyle(color: AppColors.hintColor,letterSpacing: 0.6, fontSize: FontDimen.dimen18),
        filled: true,
        isDense: true,
        fillColor: AppColors.whiteColor,
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color:AppColors.whiteColor, width: 1.5),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color: AppColors.whiteColor, width: 1.5,),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:  const BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
}



