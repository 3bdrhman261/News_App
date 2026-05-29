import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBareScreen extends StatelessWidget {
  const AppBareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A24),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF2A2A38),
                    width: 0.5,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF888780),
                  size: 25,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              'CATEGORY'.tr(),
              style: GoogleFonts.dmSans(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF555555),
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
