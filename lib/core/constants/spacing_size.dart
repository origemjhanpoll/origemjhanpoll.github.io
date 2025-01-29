import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';

class SpacingSize {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 48.0;

  static double getPadding(double screenWidth) {
    if (screenWidth < ScreenSize.small) {
      return medium;
    } else if (screenWidth < ScreenSize.medium) {
      return large;
    } else {
      return extraLarge;
    }
  }
}
