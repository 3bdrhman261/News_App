

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/core/AppConstans/AppConstans.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  
                    if (context.locale.languageCode == "en") {
                      context.setLocale(Locale("ar"));
                    } else {
                      context.setLocale(Locale("en"));
                    }
                    Appconstans.Long = context.locale.languageCode;
                  
                },
                icon: Icon(
                  Icons.language,
                  color: const Color.fromARGB(135, 129, 126, 126),
                ),
              ),
              Text(
                'TODAY\'S NEWS'.tr(),
                style: GoogleFonts.dmSans(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF888780),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),

          SizedBox(height: 4.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: ' Explore '.tr(),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFF0EDE6),
                  ),
                ),
                TextSpan(
                  text: ' Stories'.tr(),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFFE8B86D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
