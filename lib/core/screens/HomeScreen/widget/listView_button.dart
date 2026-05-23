import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListviewButton extends StatelessWidget {
  final String title;
  const ListviewButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
        decoration: BoxDecoration(
          
          border: Border.all(color: Color(0xffe9eefa), width: 2),
          borderRadius: BorderRadius.circular(60),
          color: Colors.blueGrey,
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
