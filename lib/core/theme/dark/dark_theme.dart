import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:origemjhanpoll_github_io/core/theme/dark/dark_colors.dart';
import 'package:origemjhanpoll_github_io/core/theme/extension/color_extension.dart';

class DarkTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    primaryColor: DarkColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      primary: DarkColors.primaryColor,
      seedColor: DarkColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColors.surfaceBackground,
      elevation: 8.0,
    ),
    scaffoldBackgroundColor: DarkColors.surfaceBackground,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.poppins(
        color: DarkColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.poppins(color: DarkColors.textPrimary),
      titleMedium: GoogleFonts.poppins(color: DarkColors.textPrimary),
      titleLarge: GoogleFonts.poppins(color: DarkColors.textPrimary),
      bodyMedium: GoogleFonts.poppins(
        color: DarkColors.textSecondary,
        fontSize: 18,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: DarkColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: DarkColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        color: DarkColors.textSecondary,
      ),
      labelLarge: GoogleFonts.poppins(
        color: DarkColors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    ),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: DarkColors.surfaceBackground,
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
    cardTheme: CardTheme(
      color: DarkColors.surfacePrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    extensions: [
      ColorExtension(
        stackIconsColor: DarkColors.primaryColor,
        startIconButttonColor: DarkColors.surfaceSecondary,
        secondaryStartIconButtonColor: DarkColors.primaryColor,
        endIconButtonColor: DarkColors.primaryColor,
        secondaryEndIconButtonColor: DarkColors.surfaceSecondary,
        titleSessionColor: DarkColors.secondaryColor,
        contactSocialCardColor: DarkColors.surfaceTertiary,
        primaryGradientTitleColor: DarkColors.primaryColor,
        secondaryGradientTitleColor: DarkColors.secondaryColor,
        toggleThemeIconColor: DarkColors.secondaryColor,
        menuBackgroundColor: DarkColors.surfaceBackground,
        drawerMenuIconColor: DarkColors.secondaryColor,
      ),
    ],
  );
}
