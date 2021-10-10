import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// default constants
const double defaultElevation = 16;

// colors
final backgroundColor = Color(0xFFeceff4);
final boxDecoColorDarker = Color(0xFFd8dee9);
final boxDecoColorLighter = Color(0xFFeceff4);
final shadowColor = Color(0xFF5e81ac);
final spinnerColor = Color(0xFFbf616a);
final subtitleColor = Color(0xFF434c5e);
final titleColor = Color(0xFF2e3440);

// text styles
final bigHeaderTextStyle = GoogleFonts.montserrat(
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
);

final headerTextStyle = GoogleFonts.montserrat(
  fontSize: 14.0,
  fontWeight: FontWeight.w700,
);

final subtitleTextStyle = GoogleFonts.lato(
  textStyle: TextStyle(
    color: subtitleColor,
    fontSize: 16.0,
  ),
);

final titleTextstyle = GoogleFonts.lato(
  textStyle: TextStyle(
    color: titleColor,
    fontSize: 16.0,
  ),
);
