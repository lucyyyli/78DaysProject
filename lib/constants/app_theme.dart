import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static const _lightFillColor = Colors.black;

  static ThemeData appTheme = themeData(colorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.secondary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        centerTitle: false,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.secondary,
      scaffoldBackgroundColor: colorScheme.secondary,
      highlightColor: Colors.transparent,
    );
  }

  static const ColorScheme colorScheme = ColorScheme(
    primary: Color(0xfff9b3ab),
    primaryContainer: Color(0xFFae7d78),
    secondary: Color(0xFFffefeb),
    tertiary: Color(0xFFabf9bb),
    tertiaryContainer: Color(0xFF78ae83),
    surface: Color(0xFF604039),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: Color(0xFF604039),
    onSecondary: Color(0xFF604039),
    onTertiary: Color(0xFF604039),
    onSurface: Color(0xFFffefeb),
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineSmall: GoogleFonts.shrikhand(
        fontWeight: _medium, fontSize: 30.0, color: colorScheme.surface),
    headlineMedium: GoogleFonts.shrikhand(
        fontWeight: _semiBold, fontSize: 40.0, color: colorScheme.surface),
    headlineLarge: GoogleFonts.shrikhand(
        fontWeight: _bold, fontSize: 60.0, color: colorScheme.surface),

    titleSmall: GoogleFonts.montserrat(
        fontWeight: _medium, fontSize: 14.0, color: colorScheme.surface),
    titleMedium: GoogleFonts.montserrat(
        fontWeight: _medium, fontSize: 20.0, color: colorScheme.surface),
    titleLarge: GoogleFonts.montserrat(
        fontWeight: _semiBold, fontSize: 30.0, color: colorScheme.surface),

    bodySmall: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    bodyMedium: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    bodyLarge: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 18.0),

    displaySmall: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 14.0),
    displayMedium: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    displayLarge: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 18.0),

    labelSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    labelMedium: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    labelLarge: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 18.0),
  );
}
