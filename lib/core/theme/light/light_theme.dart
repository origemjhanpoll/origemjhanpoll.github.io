import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/theme/extension/color_extension.dart';
import 'package:origemjhanpoll_github_io/core/theme/light/light_colors.dart';

class LightTheme {
  static final theme = ThemeData(
    primaryColor: LightColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.primaryColor,
      elevation: 12.0,
    ),
    scaffoldBackgroundColor:
        LightColors.surfaceBackground.withValues(alpha: 0.6),
    // textTheme: TextTheme(
    //   titleLarge: GoogleFonts.kalam(color: LightColors.textTertiary),
    //   bodyMedium: GoogleFonts.heebo(
    //     color: LightColors.textSecondary,
    //     fontSize: 18,
    //   ),
    //   bodyLarge: GoogleFonts.heebo(
    //     color: LightColors.textPrimary,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   displayMedium: GoogleFonts.kalam(
    //     color: LightColors.textPrimary,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   headlineLarge: GoogleFonts.heebo(
    //     color: LightColors.textPrimary,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   bodySmall: GoogleFonts.heebo(
    //     color: LightColors.textSecondary,
    //   ),
    //   labelLarge: GoogleFonts.heebo(
    //     color: LightColors.textTertiary,
    //     fontWeight: FontWeight.w500,
    //     fontSize: 15,
    //   ),
    // ),
    // primaryTextTheme: GoogleFonts.heeboTextTheme(),
    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor: LightColors.surfaceBackground,
    //   hintStyle: GoogleFonts.heebo(
    //     color: LightColors.textSecondary,
    //   ),
    //   labelStyle: GoogleFonts.heebo(
    //     color: LightColors.textSecondary,
    //   ),
    //   border: const OutlineInputBorder(
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(10.0),
    //     ),
    //     borderSide: BorderSide.none,
    //   ),
    //   focusedBorder: const OutlineInputBorder(
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(10.0),
    //     ),
    //     borderSide: BorderSide(
    //       color: LightColors.secondaryColor,
    //     ),
    //   ),
    //   filled: true,
    // ),
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
