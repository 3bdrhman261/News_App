import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String name;
  final String date;
  final String? image;

  const CardWidget({
    super.key,
    required this.date,
    this.image,
    required this.name,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFF13131E),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF2A2A38), width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NEWS',
                  style: GoogleFonts.dmSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFE8B86D),
                    letterSpacing: 0.8,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFE8E4DB),
                    height: 1.35,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
               //   maxLines: 2,
                  "$name.$date",
                  style: GoogleFonts.dmSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF777777),
                  ),
                ),
                
              ],
            ),
          ),

          SizedBox(width: 12.w),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Center(
              child: CachedNetworkImage(
                width: 140.w,
                height: 100.w,
                imageUrl: image ??
                    "https://th.bing.com/th/id/OIP.-mlwDVsSwfABKmZBtIBbtQHaFY?w=229&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}