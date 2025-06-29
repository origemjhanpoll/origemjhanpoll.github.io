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

    // Calcula altura responsiva com limites
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
                      children: [
                        if (element.logo != null)
                          CircleAvatar(
                            backgroundImage: NetworkImage(element.logo!),
                          ),
                        Text(element.title),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: screen.width * .3),
                          child: Text(
                            element.description,
                            maxLines: 5,
                          ),
                        )
                      ],
                    ),
                  ),
                  ...element.images.map(
                    (image) => Padding(
                      padding: EdgeInsets.only(right: SpacingSize.medium),
                      child: SizedBox.fromSize(
                        size: Size.fromWidth(375),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(18),
                          child: Image.network(
                            image,
                            fit: BoxFit.fitHeight,
                          ),
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
