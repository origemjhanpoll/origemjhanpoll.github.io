import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:origemjhanpoll_github_io/core/theme/extension/color_extension.dart';
import 'package:origemjhanpoll_github_io/core/theme/light/light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    primaryColor: LightColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      primary: LightColors.primaryColor,
      seedColor: LightColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.primaryColor,
      elevation: 12.0,
    ),
    scaffoldBackgroundColor: LightColors.surfaceBackground,
    textTheme: TextTheme(
      displayMedium: GoogleFonts.poppins(
        color: LightColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.poppins(color: LightColors.textPrimary),
      titleMedium: GoogleFonts.poppins(color: LightColors.textPrimary),
      titleLarge: GoogleFonts.poppins(color: LightColors.textPrimary),
      bodyMedium: GoogleFonts.poppins(
        color: LightColors.textSecondary,
        fontSize: 18,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: LightColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: LightColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.poppins(
        color: LightColors.textSecondary,
      ),
      labelLarge: GoogleFonts.poppins(
        color: LightColors.textPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    ),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: LightColors.surfaceBackground,
      hintStyle: GoogleFonts.poppins(
        color: LightColors.textSecondary,
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
    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    extensions: [
      ColorExtension(
        stackIconsColor: LightColors.primaryColor,
        startIconButttonColor: LightColors.surfaceSecondary,
        secondaryStartIconButtonColor: LightColors.primaryColor,
        endIconButtonColor: LightColors.primaryColor,
        secondaryEndIconButtonColor: LightColors.surfaceSecondary,
        titleSessionColor: LightColors.secondaryColor,
        contactSocialCardColor: LightColors.surfaceTertiary,
        primaryGradientTitleColor: LightColors.primaryColor,
        secondaryGradientTitleColor: LightColors.secondaryColor,
        toggleThemeIconColor: LightColors.secondaryColor,
        menuBackgroundColor: LightColors.primaryColor,
        drawerMenuIconColor: LightColors.secondaryColor,
      ),
    ],
  );
}
