import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/feature/models/about_model.dart';

class AboutWidget extends StatelessWidget {
  final AboutModel model;

  const AboutWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final padding = SpacingSize.getPadding(size.width);
    final isScreenMedium = size.width >= ScreenSize.small;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedPadding(
          duration: Durations.medium1,
          padding: EdgeInsets.only(top: padding, left: padding, right: padding),
          child: Text(
            model.title.toUpperCase(),
            style: theme.textTheme.headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Flex(
          direction: isScreenMedium ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: AnimatedPadding(
                duration: Durations.medium1,
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: SpacingSize.large),
                      child: Text(
                        '/${model.historyLabel.toUpperCase()}',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                    SelectableText(
                      model.history,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: AnimatedPadding(
                duration: Durations.medium1,
                padding: EdgeInsets.all(padding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: SpacingSize.extraLarge,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: SpacingSize.large),
                            child: Text(
                              '/${model.technologiesLabel.toUpperCase()}',
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            spacing: SpacingSize.small,
                            children: List.generate(
                              model.technologies.length,
                              (index) => SelectableText(
                                model.technologies[index],
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: SpacingSize.large),
                            child: Text(
                              '/${model.othersLabel.toUpperCase()}',
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                          Wrap(
                            spacing: SpacingSize.medium,
                            runSpacing: SpacingSize.small,
                            children: List.generate(
                              model.others.length,
                              (index) => SelectableText(
                                model.others[index],
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
