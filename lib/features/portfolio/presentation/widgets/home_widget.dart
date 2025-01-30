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
    final size = MediaQuery.of(context).size;
    final isScreenMedium = size.width >= ScreenSize.small;
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;
    final urlLauncherController = UrlLauncherController();

    return SizedBox(
      height: size.height - kToolbarHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SpacingSize.getPadding(size.width)),
        child: Flex(
          direction: isScreenMedium ? Axis.horizontal : Axis.vertical,
          verticalDirection: VerticalDirection.up,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: size.width * 0.1,
          children: [
            Flexible(
              child: Column(
                spacing: SpacingSize.small,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(localization.hello,
                      style: theme.textTheme.displayMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SelectableText(
                    localization.occupation,
                    style: theme.textTheme.headlineLarge,
                  ),
                  SelectableText(
                    localization.introduction,
                    style: theme.textTheme.bodyMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: SpacingSize.small),
                    child: Wrap(
                      spacing: SpacingSize.small,
                      runSpacing: SpacingSize.small,
                      children: [
                        FilledButton.icon(
                          onPressed: () =>
                              urlLauncherController.launchURL(UrlUtils.resume),
                          icon: Icon(Icons.attach_file),
                          style: ButtonStyle(
                              visualDensity: VisualDensity.standard),
                          label: Text(
                            localization.myresume,
                            // style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () => urlLauncherController
                              .launchURL(UrlUtils.whatsapp),
                          icon: SvgPicture.asset(
                            'assets/svg/icon_whatsapp.svg',
                            width: 20.0,
                            colorFilter: ColorFilter.mode(
                                theme.primaryColor, BlendMode.srcIn),
                          ),
                          style: ButtonStyle(
                              visualDensity: VisualDensity.standard),
                          label: Text(
                            overflow: TextOverflow.clip,
                            localization.getInTouch,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
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
