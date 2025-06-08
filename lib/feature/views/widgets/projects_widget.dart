import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/feature/models/project_model.dart';

class ProjectsWidget extends StatelessWidget {
  final List<ProjectModel> model;

  const ProjectsWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        final element = model[index];
        return Column(
          children: [
            SizedBox.fromSize(
                size: Size(200, 180), child: Image.network(element.image))
          ],
        );
      },
    );
  }
}
