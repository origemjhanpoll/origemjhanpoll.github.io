import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/utils/url_launcher_util.dart';
import 'package:origemjhanpoll_github_io/feature/models/initial_model.dart';
import 'package:origemjhanpoll_github_io/gen/assets.gen.dart';

class InitialWidget extends StatelessWidget {
  final InitialModel model;
  const InitialWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isScreenMedium = size.width >= ScreenSize.small;
    final padding = SpacingSize.getPadding(size.width);
    final urlLauncherUtil = UrlLauncherUtil();

    return AnimatedPadding(
      duration: Durations.medium1,
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: SpacingSize.medium,
        children: [
          CircleAvatar(
            radius: size.height * 0.2,
            backgroundImage: AssetImage(Assets.images.origemjhanpoll.path),
          ),
          AnimatedDefaultTextStyle(
            duration: Durations.medium1,
            style: theme.textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: !isScreenMedium ? 28.0 : null),
            child: Text(model.name),
          ),
          AnimatedDefaultTextStyle(
            duration: Durations.medium1,
            style: theme.textTheme.headlineLarge!
                .copyWith(fontSize: !isScreenMedium ? 20.0 : null),
            child: Text(model.role),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: SpacingSize.medium),
            child: AnimatedContainer(
              duration: Durations.medium1,
              constraints: BoxConstraints(
                  maxWidth:
                      isScreenMedium ? size.width * 0.5 : size.width * 0.8),
              child: Text(
                model.description,
                maxLines: 4,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          Wrap(
            spacing: SpacingSize.small,
            runSpacing: SpacingSize.small,
            children: [
              FilledButton.icon(
                onPressed: () =>
                    urlLauncherUtil.launchURL(model.buttons.first.url),
                icon: Icon(Icons.attach_file),
                style: ButtonStyle(visualDensity: VisualDensity.standard),
                label: Text(
                  model.buttons[0].text,
                  softWrap: true,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () =>
                    urlLauncherUtil.launchURL(model.buttons.last.url),
                icon: SvgPicture.asset(
                  Assets.svg.iconWhatsApp,
                  width: 20.0,
                  colorFilter: ColorFilter.mode(
                      theme.colorScheme.secondary, BlendMode.srcIn),
                ),
                style: ButtonStyle(visualDensity: VisualDensity.standard),
                label: Text(
                  model.buttons.last.text,
                  overflow: TextOverflow.clip,
                  style: theme.textTheme.bodyMedium,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
