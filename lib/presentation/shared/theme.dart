import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme appTheme = GoogleFonts.latoTextTheme(
  TextTheme(
      headline2: TextStyle(
        fontSize: 28.sp,
      ),
      bodyText1: TextStyle(
        fontSize: 20.sp,
      ),
      subtitle1: TextStyle(
        fontSize: 14.sp,
        color: const Color(0xFFBCBCBC),
      ),
      subtitle2: TextStyle(
        fontSize: 10.sp,
        color: Colors.white,
      )),
);
