import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_api/core/screens/HomeScreen/models/top_headline_models.dart';
import 'package:news_api/core/screens/HomeScreen/servises/home_screen_servises.dart';
import 'package:news_api/core/screens/HomeScreen/widget/card_widget.dart';
import 'package:news_api/core/screens/HomeScreen/widget/listView_button.dart';
import 'package:news_api/core/screens/HomeScreen/widget/top_head_line.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    HomeScreenServises().getToplineArtcels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0F),
        elevation: 0,
        toolbarHeight: 110.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TODAY\'S NEWS',
              style: GoogleFonts.dmSans(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF888780),
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 4.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Explore ',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFFF0EDE6),
                    ),
                  ),
                  TextSpan(
                    text: 'Stories',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFFE8B86D),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: const Color(0xFF888780), size: 30),
          ),
        ],
      ),
      body: FutureBuilder(
        future: HomeScreenServises().getToplineArtcels(),
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
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 28.w),
                  child: SizedBox(
                    height: 36.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ListviewButton(title: "travel".tr(),),
                        ListviewButton(title: "technology".tr()),
                        ListviewButton(title: "entertainment".tr()),
                        ListviewButton(title: "Business".tr()),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: TopHeadLine(
                    date: DateFormat(
                      'yyyy/ MM/ dd _ KK:mm',
                    ).format(topHeadlineModels.articles![0].publishedAt!),
                    image: topHeadlineModels.articles![0].urlToImage,
                    name: topHeadlineModels.articles![0].title ?? "",
                    title: topHeadlineModels.articles![0].author ?? "",
                  ),
                ),

                SizedBox(height: 17.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: topHeadlineModels.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadlineModels.articles![index];
                        return CardWidget(
                          image: article.urlToImage,
                          date: DateFormat(
                            'yyyy/MM/dd  KK:mm',
                          ).format(topHeadlineModels.articles![0].publishedAt!),
                          name: article.author ?? "",
                          title: article.title ?? "",
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
              "Something Went Wrong",
              style: GoogleFonts.dmSans(color: const Color(0xFF888780)),
            ),
          );
        },
      ),
    );
  }
}
