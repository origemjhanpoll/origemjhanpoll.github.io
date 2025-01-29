import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:origemjhanpoll_github_io/config/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/config/constants/url_utils.dart';
import 'package:origemjhanpoll_github_io/core/theme/extension/color_extension.dart';
import 'package:origemjhanpoll_github_io/core/utils/url_launcher_controller.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isScreenMedium = size.width >= ScreenSize.small;
    final theme = Theme.of(context);
    final colors = theme.extension<ColorExtension>()!;
    final localization = AppLocalizations.of(context)!;
    final urlLauncherController = UrlLauncherController();

    return SizedBox(
      height: size.height - kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Flex(
          direction: isScreenMedium ? Axis.horizontal : Axis.vertical,
          verticalDirection: VerticalDirection.up,
          children: [
            Flexible(
              child: Column(
                spacing: 8.0,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: isScreenMedium
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
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
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: isScreenMedium ? 400.0 : 250.0, minWidth: 200.0),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/origemjhanpoll.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
