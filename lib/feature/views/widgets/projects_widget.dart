import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/feature/models/project_model.dart';

class ProjectsWidget extends StatelessWidget {
  final ProjectsModel model;

  const ProjectsWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screen = MediaQuery.sizeOf(context);
    final padding = SpacingSize.getPadding(screen.width);

    final minHeight = 400.0;
    final maxHeight = 812.0;
    final responsiveHeight = (screen.height * 0.85).clamp(minHeight, maxHeight);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: SpacingSize.large),
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
                children: [
                  AnimatedPadding(
                    duration: Durations.medium1,
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: SpacingSize.small,
                      children: [
                        if (element.logo != null)
                          CircleAvatar(
                            radius: 48.0,
                            backgroundImage: NetworkImage(element.logo!),
                            onBackgroundImageError: (exception, stackTrace) {},
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
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: screen.width * .3),
                          child: Text(
                            element.description,
                            style: theme.textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                  ...element.images.map(
                    (image) => Padding(
                      padding: EdgeInsets.only(right: SpacingSize.medium),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          image,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 300,
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
