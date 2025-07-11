import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:origemjhanpoll_github_io/core/theme/light/light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      primary: LightColors.primaryColor,
      secondary: LightColors.secondaryColor,
      seedColor: LightColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.surfaceBackground,
      elevation: 8.0,
    ),
    drawerTheme:
        DrawerThemeData(backgroundColor: LightColors.surfaceBackground),
    scaffoldBackgroundColor: LightColors.surfaceBackground,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.poppins(
        color: LightColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.poppins(color: LightColors.textPrimary),
      titleMedium: GoogleFonts.poppins(color: LightColors.textPrimary),
      titleLarge: GoogleFonts.poppins(color: LightColors.textPrimary),
      bodySmall: GoogleFonts.dmSans(color: LightColors.textSecondary),
      bodyMedium: GoogleFonts.dmSans(color: LightColors.textSecondary),
      bodyLarge: GoogleFonts.dmSans(color: LightColors.textSecondary),
      labelMedium: GoogleFonts.poppins(color: LightColors.textTertiary),
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
          GoogleFonts.poppins(color: LightColors.surfacePrimary)),
    )),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: LightColors.surfacePrimary,
      hintStyle: GoogleFonts.poppins(
        color: const Color.fromARGB(255, 3, 2, 2),
      ),
      labelStyle: GoogleFonts.poppins(
        color: LightColors.textSecondary,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          color: LightColors.secondaryColor,
        ),
      ),
      filled: true,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(LightColors.secondaryColor),
      radius: const Radius.circular(16.0),
      thickness: WidgetStatePropertyAll(4.0),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    extensions: [],
  );
}
