import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:news_api/core/routering/app_routering.dart';

import 'package:news_api/core/screens/HomeScreen/models/top_headline_models.dart';
import 'package:news_api/core/screens/HomeScreen/servises/home_screen_servises.dart';
import 'package:news_api/core/screens/HomeScreen/widget/AppBar.dart';
import 'package:news_api/core/screens/HomeScreen/widget/card_widget.dart';
import 'package:news_api/core/screens/HomeScreen/widget/listView_button.dart';
import 'package:news_api/core/screens/HomeScreen/widget/text-Felf-Screen.dart';
import 'package:news_api/core/screens/HomeScreen/widget/top_head_line.dart';

class HomeScreen extends StatefulWidget {
 
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0F),
        elevation: 0,
        toolbarHeight: 130.h,
        title: Appbar(),
        actions: [Textfelfscreen()],
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
                  "No_ Results".tr(),
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
                        ListviewButton(
                          isActive: true,
                          title: "travel".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRouter.searchResultsScreen,
                              extra: "travel".tr(),
                            );
                          },
                        ),
                        ListviewButton(
                          isActive: true,
                          title: "technology".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRouter.searchResultsScreen,
                              extra: "technology".tr(),
                            );
                          },
                        ),
                        ListviewButton(
                          isActive: true,
                          title: "entertainment".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRouter.searchResultsScreen,
                              extra: "entertainment".tr(),
                            );
                          },
                        ),
                        ListviewButton(
                          isActive: true,
                          title: "Business".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRouter.searchResultsScreen,
                              extra: "Business".tr(),
                            );
                          },
                        ),
                        ListviewButton(
                          isActive: true,
                          title: "Football".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRouter.searchResultsScreen,
                              extra: "Football".tr(),
                            );
                          },
                        ),
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
                          ontap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRouter.artcleScreen, extra: article);
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
