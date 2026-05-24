import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/core/screens/HomeScreen/widget/card_widget.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 34.w,
                      height: 34.w,
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
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'CATEGORY',
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

            // ── Hero Banner ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: SizedBox(
                  height: 140.h,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://th.bing.com/th/id/OIP.-mlwDVsSwfABKmZBtIBbtQHaFY?w=229&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.55),
                        colorBlendMode: BlendMode.darken,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(12.w),
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
                              Text(
                                'Explore\nthe World',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFFF0EDE6),
                                  height: 1.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 14.h),

            // ── Section Header ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                'Latest in ',
                style: GoogleFonts.dmSans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFF0EDE6),
                ),
              ),
            ),

            SizedBox(height: 8.h),

            // ── Cards List ──
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CardWidget(
                      image: null,
                      date: "2026_05_23 - 10:34",
                      name: "Abdallah Yassein",
                      title: "Top Stories in  You Should Read Today",
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
