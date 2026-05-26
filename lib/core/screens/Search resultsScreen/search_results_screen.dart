import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/core/routering/app_routering.dart';
import 'package:news_api/core/screens/HomeScreen/models/top_headline_models.dart';
import 'package:news_api/core/screens/HomeScreen/widget/card_widget.dart';
import 'package:news_api/core/screens/Search%20resultsScreen/servises/search_servises.dart';

class SearchResultsScreen extends StatefulWidget {
  final String query;
  const SearchResultsScreen({super.key, required this.query});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),

      body: FutureBuilder(
        future: SearchServises().seatchItemByName(widget.query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFE8B86D)),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: GoogleFonts.dmSans(color: const Color(0xFF888780)),
              ),
            );
          }

          if (snapshot.hasData) {
            TopHeadlineModels topHeadlineModels =
                snapshot.data! as TopHeadlineModels;
            if (topHeadlineModels.totalResults == 0) {
              return Center(
                child: Text(
                  "f".tr(),
                  style: GoogleFonts.dmSans(color: const Color(0xFF888780)),
                ),
              );
            }

            return Column(
              children: [
                SizedBox(height: 50.h),
                Container(
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
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: topHeadlineModels.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadlineModels.articles![index];
                        return CardWidget(
                          ontap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouter.artcleScreen,extra: article);
                          },
                          
                         article: article,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text(
              "Something Went Wrong".tr(),
              style: GoogleFonts.dmSans(color: const Color(0xFF888780)),
            ),
          );

        },
      ),
    );
  }
}
