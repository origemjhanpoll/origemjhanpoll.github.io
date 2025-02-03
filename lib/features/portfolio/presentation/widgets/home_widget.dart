import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/url_utils.dart';
import 'package:origemjhanpoll_github_io/core/utils/url_launcher_util.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isScreenMedium = size.width >= ScreenSize.small;
    final padding = SpacingSize.getPadding(size.width);
    final localization = AppLocalizations.of(context)!;
    final urlLauncherUtil = UrlLauncherUtil();

    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight),
      child: Flex(
        direction: isScreenMedium ? Axis.horizontal : Axis.vertical,
        mainAxisSize: isScreenMedium ? MainAxisSize.max : MainAxisSize.min,
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: AnimatedPadding(
              duration: Durations.medium1,
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: isScreenMedium
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(localization.hello,
                      style: theme.textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: !isScreenMedium ? 28.0 : null)),
                  SelectableText(
                    localization.occupation,
                    style: theme.textTheme.headlineLarge!
                        .copyWith(fontSize: !isScreenMedium ? 20.0 : null),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: SpacingSize.large),
                    child: SelectableText(
                      localization.introduction,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Wrap(
                    spacing: SpacingSize.small,
                    runSpacing: SpacingSize.small,
                    children: [
                      FilledButton.icon(
                        onPressed: () =>
                            urlLauncherUtil.launchURL(UrlUtils.resume),
                        icon: Icon(Icons.attach_file),
                        style:
                            ButtonStyle(visualDensity: VisualDensity.standard),
                        label: Text(
                          localization.myresume,
                          softWrap: true,
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () =>
                            urlLauncherUtil.launchURL(UrlUtils.whatsapp),
                        icon: SvgPicture.asset(
                          'assets/svg/icon_whatsapp.svg',
                          width: 20.0,
                          colorFilter: ColorFilter.mode(
                              theme.colorScheme.secondary, BlendMode.srcIn),
                        ),
                        style:
                            ButtonStyle(visualDensity: VisualDensity.standard),
                        label: Text(
                          overflow: TextOverflow.clip,
                          localization.getInTouch,
                          style: theme.textTheme.bodyMedium,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: AnimatedPadding(
              duration: Durations.medium1,
              padding: EdgeInsets.all(padding * (size.width * 0.002)),
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/origemjhanpoll.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
