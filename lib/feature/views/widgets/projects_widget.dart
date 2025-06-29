import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/utils/url_launcher_util.dart';
import 'package:origemjhanpoll_github_io/feature/models/project_model.dart';
import 'package:origemjhanpoll_github_io/gen/assets.gen.dart';

class ProjectsWidget extends StatelessWidget {
  final ProjectsModel model;

  const ProjectsWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.sizeOf(context);
    final padding = SpacingSize.getPadding(screen.width);
    final isMobileScreen = screen.width < ScreenSize.medium;
    final urlLauncherUtil = UrlLauncherUtil();

    final minHeight = 400.0;
    final maxHeight = 812.0;
    final responsiveHeight = (screen.height * 0.85).clamp(minHeight, maxHeight);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: SpacingSize.large * 2),
          child: Text(
            model.title.toUpperCase(),
            style: theme.textTheme.headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: responsiveHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: model.items.length,
            itemBuilder: (context, index) {
              final element = model.items[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox.fromSize(
                    size: Size.fromWidth(
                        screen.width * (isMobileScreen ? .9 : .3)),
                    child: AnimatedPadding(
                      duration: Durations.medium1,
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SpacingSize.small,
                        children: [
                          if (element.logo != null)
                            CircleAvatar(
                              radius: 54.0,
                              backgroundImage: NetworkImage(element.logo!),
                              onBackgroundImageError:
                                  (exception, stackTrace) {},
                              child: element.logo == null
                                  ? Icon(
                                      Icons.business,
                                      size: 30,
                                      color: theme.colorScheme.onSurface,
                                    )
                                  : null,
                            ),
                          Text(
                            element.title,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            element.description,
                            style: theme.textTheme.bodyLarge,
                          ),
                          Row(
                            spacing: SpacingSize.small,
                            children: [
                              if (element.appstore != null)
                                InkWell(
                                  onTap: () => urlLauncherUtil
                                      .launchURL(element.appstore!),
                                  child: SvgPicture.asset(
                                      Assets.svg.applestoreDark),
                                ),
                              if (element.playstore != null)
                                InkWell(
                                  onTap: () => urlLauncherUtil
                                      .launchURL(element.playstore!),
                                  child: SvgPicture.asset(
                                      Assets.svg.playstoreDark),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ...element.images.map(
                    (image) => Padding(
                      padding: EdgeInsets.only(right: SpacingSize.medium),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          image,
                          width: isMobileScreen ? 195 : 300,
                          height: isMobileScreen ? 347.88 : 535.2,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: isMobileScreen ? 195 : 300,
                              height: isMobileScreen ? 347.88 : 535.2,
                              decoration: BoxDecoration(
                                color:
                                    theme.colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
