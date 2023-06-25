import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Textstyle
final TextStyle bHeading1 = GoogleFonts.inter(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Color(0xFF006778),
);
final TextStyle bSubHeading1 = GoogleFonts.inter(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

//theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.interTextTheme(),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xFF006778),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(10),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    filled: true,
    fillColor: Color(0xFF247881).withOpacity(0.3),
    labelStyle: TextStyle(color: Color(0xFF006778)),
    suffixStyle: TextStyle(color: Color(0xFF006778)),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.transparent, width: 2),
    ),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.transparent, width: 2),
    ),
  ),
);
