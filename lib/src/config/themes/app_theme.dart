import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(color: Color(0xff57BA4F), elevation: 0),
      primaryColor: const Color(0x0fffffff),
      splashColor: const Color(0xff57BA4F),
      textTheme: GoogleFonts.cairoTextTheme(),
      fontFamily: 'Cairo',
    );
  }
}
