import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopHeadLine extends StatelessWidget {
  final String title;
  final String name;
  final String date;
  final String? image;

  const TopHeadLine({
    super.key,
    required this.date,
    this.image,
    required this.name,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: SizedBox(
        height: 220.h,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: image ??
                  "https://th.bing.com/th/id/OIP.-mlwDVsSwfABKmZBtIBbtQHaFY?w=229&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.45),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.85),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8B86D),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'FEATURED',
                        style: GoogleFonts.dmSans(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0A0A0F),
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),

                    SizedBox(height: 8.h),
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFF0EDE6),
                        height: 1.3,
                      ),
                    ),

                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.dmSans(
                            fontSize: 11.sp,
                            color: const Color(0xFFAAAAAA),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Container(
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: Color(0xFF555555),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Text(
                          date,
                          style: GoogleFonts.dmSans(
                            fontSize: 11.sp,
                            color: const Color(0xFFAAAAAA),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
