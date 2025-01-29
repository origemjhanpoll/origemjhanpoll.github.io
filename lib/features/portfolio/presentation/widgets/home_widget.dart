import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:origemjhanpoll_github_io/config/constants/url_utils.dart';
import 'package:origemjhanpoll_github_io/core/theme/extension/color_extension.dart';
import 'package:origemjhanpoll_github_io/core/utils/url_launcher_controller.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final colors = theme.extension<ColorExtension>()!;
    final localization = AppLocalizations.of(context)!;
    final urlLauncherController = UrlLauncherController();

    return SizedBox(
      height: size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      colors.primaryGradientTitleColor,
                      colors.secondaryGradientTitleColor
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: SelectableText(localization.hello,
                      style: theme.textTheme.displayMedium!
                          .copyWith(color: Colors.white)),
                ),
                SelectableText(
                  localization.occupation,
                  style: theme.textTheme.headlineLarge,
                ),
                SelectableText(
                  localization.introduction,
                  style: theme.textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    FilledButton.icon(
                      onPressed: () =>
                          urlLauncherController.launchURL(UrlUtils.resume),
                      icon: Icon(Icons.file_present_rounded),
                      label: Text(localization.myresume),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.38,
            child: Image.asset(
              'assets/images/code-3.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
