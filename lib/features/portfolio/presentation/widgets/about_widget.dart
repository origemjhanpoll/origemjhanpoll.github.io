import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';

const listTechnologies = [
  'Flutter',
  'Dart',
  'React Natie',
  'TypeScript',
  'ReactJs',
  'JavaScript'
];

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final isScreenMedium = size.width >= ScreenSize.small;

    return Flex(
      direction: isScreenMedium ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(SpacingSize.getPadding(size.width)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  'Um pouco sobre mim.',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
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
          child: Padding(
            padding: EdgeInsets.all(SpacingSize.getPadding(size.width)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tecnologias que domino.',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: SpacingSize.large),
                  child: Text(
                    '/TECNOLOGIA',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: listTechnologies.length,
                  itemBuilder: (_, index) => SelectableText(
                    listTechnologies[index],
                    style: theme.textTheme.bodyLarge!
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: SpacingSize.small),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

const lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam volutpat orci non posuere porttitor. Sed ornare, libero convallis dictum convallis, mauris diam condimentum enim, sit amet laoreet nibh ex ut nibh. Praesent arcu dolor, placerat sed ullamcorper ac, maximus a purus. Vivamus tempor lacinia tellus, vitae tempus metus dictum at.';
