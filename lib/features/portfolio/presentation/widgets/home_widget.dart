import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/url_utils.dart';
import 'package:origemjhanpoll_github_io/core/utils/url_launcher_controller.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isScreenMedium = size.width >= ScreenSize.small;
    final localization = AppLocalizations.of(context)!;
    final urlLauncherController = UrlLauncherController();

    return Flex(
      direction: isScreenMedium ? Axis.horizontal : Axis.vertical,
      verticalDirection: VerticalDirection.up,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: isScreenMedium ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(SpacingSize.getPadding(size.width)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(localization.hello,
                    style: theme.textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: !isScreenMedium ? 38.0 : null)),
                SelectableText(
                  localization.occupation,
                  style: theme.textTheme.headlineLarge!
                      .copyWith(fontSize: !isScreenMedium ? 22.0 : null),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: SpacingSize.large),
                  child: SelectableText(
                    localization.introduction,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Wrap(
                  spacing: SpacingSize.small,
                  runSpacing: SpacingSize.small,
                  children: [
                    FilledButton.icon(
                      onPressed: () =>
                          urlLauncherController.launchURL(UrlUtils.resume),
                      icon: Icon(Icons.attach_file),
                      style: ButtonStyle(visualDensity: VisualDensity.standard),
                      label: Text(
                        localization.myresume,
                        // style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () =>
                          urlLauncherController.launchURL(UrlUtils.whatsapp),
                      icon: SvgPicture.asset(
                        'assets/svg/icon_whatsapp.svg',
                        width: 20.0,
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.secondary, BlendMode.srcIn),
                      ),
                      style: ButtonStyle(visualDensity: VisualDensity.standard),
                      label: Text(
                        overflow: TextOverflow.clip,
                        localization.getInTouch,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(SpacingSize.getPadding(size.width)),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400, minWidth: 200),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/origemjhanpoll.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
