import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListviewButton extends StatelessWidget {
  final String title;
  final bool isActive;

  const ListviewButton({
    super.key,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFFE8B86D)
              : const Color(0xFF1A1A24),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isActive
                ? const Color(0xFFE8B86D)
                : const Color(0xFF2A2A38),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.dmSans(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: isActive
                ? const Color(0xFF0A0A0F)
                : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }
}