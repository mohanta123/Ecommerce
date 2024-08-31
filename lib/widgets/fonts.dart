import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextFont {
  static TextStyle get normal_TextStyle =>
      GoogleFonts.montserrat(); // Use Google Fonts or your preferred font

  static TextStyle normal_TextStyleWithColor(Color color) =>
      GoogleFonts.montserrat(color: color);

  static TextStyle get bold_TextStyle =>
      GoogleFonts.montserrat(fontWeight: FontWeight.bold);
}