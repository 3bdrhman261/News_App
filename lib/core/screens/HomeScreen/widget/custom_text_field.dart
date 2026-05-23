
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final bool? isPassword;
  final Widget? suffixIcon;
  final String? nameField;
  final int? maxLine;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Icon? icons;

  const CustomTextField({
    super.key,
    this.isPassword,
    this.suffixIcon,
    this.nameField,
    this.controller,
    this.validator,
    this.keyboardType,
    this.maxLine,
    this.icons,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 331.w,
      height: 80.h,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextFormField(
        cursorColor: const Color.fromARGB(255, 106, 104, 104),

        maxLines: maxLine ?? 1,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        validator: validator,
        obscureText: isPassword ?? false,
        autofocus: false,

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1,
              color: const Color.fromARGB(221, 208, 207, 207),
            ),
          ),
          prefixIcon: icons,
          hintText: nameField ?? "",

          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: Color.fromARGB(255, 204, 206, 209),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(width: 1.w, ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),

            borderSide: BorderSide(width: 1.w, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              width: 1.w,
              color: const Color.fromARGB(255, 227, 28, 28),
            ),
          ),

          filled: false,
          fillColor: Color.fromARGB(255, 255, 255, 255),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
