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
    primary: Color(0xfff1999b),
    primaryContainer: Color(0xFFe77375),
    secondary: Color(0xFFffefeb),
    secondaryContainer: Color(0xFFe77375),
    tertiary: Color(0xfff1999b),
    tertiaryContainer: Color(0xFF6BAC3B),
    surface: Color(0xFF5E3734),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: Color(0xFF5E3734),
    onSecondary: Color(0xFF5E3734),
    onTertiary: Color(0xFF5E3734),
    onSurface: Color(0xfff1999b),
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
      fontWeight: _bold,
      fontSize: 60.0,
      color: colorScheme.tertiary,
      shadows: <Shadow>[
        Shadow(
          offset: Offset(-5.0, 5.0),
          blurRadius: 5.0,
          color: colorScheme.tertiaryContainer,
        ),
        // Shadow(
        //   offset: Offset(-3.0, 3.0),
        //   blurRadius: 8.0,
        //   color: Color.fromARGB(125, 0, 0, 255),
        // )
      ],
    ),
    titleSmall: GoogleFonts.montserrat(
        fontWeight: _medium, fontSize: 14.0, color: colorScheme.surface),
    titleMedium: GoogleFonts.montserrat(
        fontWeight: _medium, fontSize: 20.0, color: colorScheme.surface),
    titleLarge: GoogleFonts.montserrat(
        fontWeight: _semiBold,
        fontSize: 30.0,
        color: colorScheme.surface,
    fontStyle: FontStyle.italic),
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
