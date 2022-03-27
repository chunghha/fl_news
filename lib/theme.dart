import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// default constants
const double defaultElevation = 16;

// colors
const backgroundColor = Color(0xFFeceff4);
const boxDecoColorDarker = Color(0xFFd8dee9);
const boxDecoColorLighter = Color(0xFFeceff4);
const primaryColor = Color(0xFF2e3440);
const shadowColor = Color(0xFF5e81ac);
const spinnerColor = Color(0xFFbf616a);
const subtitleColor = Color(0xFF434c5e);
const titleColor = Color(0xFF2e3440);

// text styles
final bigHeaderTextStyle = GoogleFonts.montserrat(
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

final headerTextStyle = GoogleFonts.montserrat(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

final subtitleTextStyle = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: subtitleColor,
    fontSize: 16,
  ),
);

final titleTextstyle = GoogleFonts.lato(
  textStyle: const TextStyle(
    color: titleColor,
    fontSize: 16,
  ),
);
