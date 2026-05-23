import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/core/screens/HomeScreen/widget/listView_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe9eefa),
        toolbarHeight: 120,
        title: Text(
          'Explore'.tr(),
          style: GoogleFonts.inter(
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 32.w),
            child: SizedBox(
              height: 45.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: [
                  ListviewButton(title: "travel".tr()),
                  ListviewButton(title: "technology".tr()),
                  ListviewButton(title: "entertainment".tr()),
                ],
              ),
            ),
          ),

          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(children: [Image.network("")]),
          ),
        ],
      ),
    );
  }
}
