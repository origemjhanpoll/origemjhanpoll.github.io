import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

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
          child: SelectableText(
            'Um pouco sobre mim.',
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
                        '/HISTÓRIA',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                    SelectableText(
                      lorem,
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
                              '/TECNOLOGIAS',
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            spacing: SpacingSize.small,
                            children: List.generate(
                              technologies.length,
                              (index) => SelectableText(
                                technologies[index],
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
                              '/OUTROS',
                              style: theme.textTheme.labelMedium,
                            ),
                          ),
                          Wrap(
                            spacing: SpacingSize.small,
                            runSpacing: SpacingSize.small,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: SpacingSize.small,
                                children: List.generate(
                                  toolsAndPlatforms_1.length,
                                  (index) => SelectableText(
                                    toolsAndPlatforms_1[index],
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: SpacingSize.small,
                                children: List.generate(
                                  toolsAndPlatforms_2.length,
                                  (index) => SelectableText(
                                    toolsAndPlatforms_2[index],
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            ],
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

const lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam volutpat orci non posuere porttitor. Sed ornare, libero convallis dictum convallis, mauris diam condimentum enim, sit amet laoreet nibh ex ut nibh. Praesent arcu dolor, placerat sed ullamcorper ac, maximus a purus. Vivamus tempor lacinia tellus, vitae tempus metus dictum at.';
const technologies = [
  'Flutter',
  'Dart',
  'React Native',
  'TypeScript',
  'Android',
  'iOS',
  'ReactJs',
  'JavaScript',
];

const toolsAndPlatforms_1 = [
  'Bitbucket',
  'CI/CD',
  'Codemagic',
  'CSS',
  'Figma',
  'Firebase',
  'Git',
  'Google Cloud',
];
const toolsAndPlatforms_2 = [
  'GraphQL',
  'HTML',
  'Jira',
];
