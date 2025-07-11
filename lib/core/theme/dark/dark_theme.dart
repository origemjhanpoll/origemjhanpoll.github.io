import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:origemjhanpoll_github_io/core/theme/dark/dark_colors.dart';

class DarkTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    primaryColor: DarkColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      primary: DarkColors.primaryColor,
      secondary: DarkColors.secondaryColor,
      seedColor: DarkColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColors.surfaceBackground,
      elevation: 8.0,
    ),
    drawerTheme: DrawerThemeData(backgroundColor: DarkColors.surfaceBackground),
    scaffoldBackgroundColor: DarkColors.surfaceBackground,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.poppins(
        color: DarkColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.poppins(color: DarkColors.textPrimary),
      titleMedium: GoogleFonts.poppins(color: DarkColors.textSecondary),
      titleLarge: GoogleFonts.poppins(color: DarkColors.textPrimary),
      bodySmall: GoogleFonts.dmSans(color: DarkColors.textSecondary),
      bodyMedium: GoogleFonts.dmSans(color: DarkColors.textSecondary),
      bodyLarge: GoogleFonts.dmSans(color: DarkColors.textSecondary),
      labelMedium: GoogleFonts.poppins(color: DarkColors.textTertiary),
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
          GoogleFonts.poppins(color: DarkColors.textSecondary)),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(DarkColors.primaryColor),
    )),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: DarkColors.surfacePrimary,
      hintStyle: GoogleFonts.poppins(
        color: DarkColors.textSecondary,
      ),
      labelStyle: GoogleFonts.poppins(
        color: DarkColors.textSecondary,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          color: DarkColors.secondaryColor,
        ),
      ),
      filled: true,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStatePropertyAll(DarkColors.secondaryColor),
      radius: const Radius.circular(16.0),
      thickness: WidgetStatePropertyAll(4.0),
    ),
    cardTheme: CardThemeData(
      color: DarkColors.surfacePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    extensions: [],
  );
}
