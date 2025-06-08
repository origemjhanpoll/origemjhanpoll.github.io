import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/feature/models/project_model.dart';

class ProjectsWidget extends StatelessWidget {
  final List<ProjectModel> model;

  const ProjectsWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = SpacingSize.getPadding(size.width);
    return SizedBox(
      height: 480,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: model.length,
        itemBuilder: (context, index) {
          final element = model[index];
          return AnimatedContainer(
            width: 380,
            duration: Durations.medium1,
            padding: EdgeInsets.only(left: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SpacingSize.small,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    element.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(element.title,
                    style: Theme.of(context).textTheme.titleLarge),
                Wrap(
                  spacing: 4,
                  runSpacing: 2,
                  children: element.technologies
                      .map((item) => Chip(label: Text(item)))
                      .toList(),
                ),
                const SizedBox(height: 4),
                Text(
                  element.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(element.year.toString()),
                const SizedBox(height: 8),
                Wrap(
                  spacing: SpacingSize.small,
                  children: [
                    FilledButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_outlined),
                        label: Text('Preview')),
                    OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.code),
                        label: Text('Github')),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
