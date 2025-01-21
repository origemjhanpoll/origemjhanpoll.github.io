import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  ColorExtension({
    required this.stackIconsColor,
    required this.startIconButttonColor,
    required this.secondaryStartIconButtonColor,
    required this.endIconButtonColor,
    required this.secondaryEndIconButtonColor,
    required this.titleSessionColor,
    required this.contactSocialCardColor,
    required this.primaryGradientTitleColor,
    required this.secondaryGradientTitleColor,
    required this.toggleThemeIconColor,
    required this.menuBackgroundColor,
    required this.drawerMenuIconColor,
  });
  final Color stackIconsColor;
  final Color startIconButttonColor;
  final Color secondaryStartIconButtonColor;
  final Color endIconButtonColor;
  final Color secondaryEndIconButtonColor;
  final Color titleSessionColor;
  final Color contactSocialCardColor;
  final Color primaryGradientTitleColor;
  final Color secondaryGradientTitleColor;
  final Color toggleThemeIconColor;
  final Color menuBackgroundColor;
  final Color drawerMenuIconColor;

  @override
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    if (other == null || t < 0.5) return this;
    return other;
  }

  @override
  ColorExtension copyWith() {
    Color? stackIconsColor;
    Color? startIconButttonColor;
    Color? secondaryStartIconButtonColor;
    Color? endIconButtonColor;
    Color? secondaryEndIconButtonColor;
    Color? titleSessionColor;
    Color? contactSocialCardColor;
    Color? primaryGradientTitleColor;
    Color? secondaryGradientTitleColor;
    Color? toggleThemeIconColor;
    Color? menuBackgroundColor;
    Color? drawerMenuIconColor;

    return ColorExtension(
      stackIconsColor: stackIconsColor ?? this.stackIconsColor,
      startIconButttonColor:
          startIconButttonColor ?? this.startIconButttonColor,
      secondaryStartIconButtonColor:
          secondaryStartIconButtonColor ?? this.secondaryStartIconButtonColor,
      endIconButtonColor: endIconButtonColor ?? this.endIconButtonColor,
      secondaryEndIconButtonColor:
          secondaryEndIconButtonColor ?? this.secondaryEndIconButtonColor,
      titleSessionColor: titleSessionColor ?? this.titleSessionColor,
      contactSocialCardColor:
          contactSocialCardColor ?? this.contactSocialCardColor,
      primaryGradientTitleColor:
          primaryGradientTitleColor ?? this.primaryGradientTitleColor,
      secondaryGradientTitleColor:
          secondaryGradientTitleColor ?? this.secondaryGradientTitleColor,
      toggleThemeIconColor: toggleThemeIconColor ?? this.toggleThemeIconColor,
      menuBackgroundColor: menuBackgroundColor ?? this.menuBackgroundColor,
      drawerMenuIconColor: drawerMenuIconColor ?? this.drawerMenuIconColor,
    );
  }
}
