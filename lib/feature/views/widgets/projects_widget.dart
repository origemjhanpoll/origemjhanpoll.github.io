import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
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
    final isScreenMedium = screen.width >= ScreenSize.small;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text(
          'Projetos'.toUpperCase(),
          style: theme.textTheme.headlineMedium!
              .copyWith(fontWeight: FontWeight.bold),
        )),
        SizedBox.fromSize(
          size: Size.fromHeight(screen.height * 0.9),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: model.items.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index) {
              return FlutterLogo();
            },
          ),
        ),
        // SizedBox.fromSize(
        //   size: Size.fromHeight(screen.height * 0.9),
        //   child: ListView(
        //     scrollDirection: Axis.horizontal,
        //     padding: EdgeInsets.all(padding),
        //     shrinkWrap: true,
        //     children: List.generate(model.length, (index) {
        //       final element = model[index];
        //       return SizedBox.fromSize(
        //         size: Size.fromWidth(
        //             isScreenMedium ? screen.width * 0.3 : screen.width * 0.8),
        //         child: _ElementProjectWidget(
        //           title: element.title,
        //           description: element.description,
        //           technologies: element.technologies,
        //           image: element.image,
        //           url: element.url,
        //           github: element.github,
        //           year: 2023,
        //           types: element.types,
        //         ),
        //       );
        //     }),
        //   ),
        // ),
      ],
    );
  }
}

class _ElementProjectWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String image;
  final String url;
  final String github;
  final int year;
  final List<String> types;

  const _ElementProjectWidget({
    required this.title,
    required this.description,
    required this.technologies,
    required this.image,
    required this.url,
    required this.github,
    required this.year,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: SpacingSize.medium),
      child: Padding(
        padding: EdgeInsets.all(SpacingSize.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 200,
                height: 180,
              ),
            ),
            Text(title,
                maxLines: 3, style: Theme.of(context).textTheme.titleLarge),
            Wrap(
              spacing: 4,
              runSpacing: 2,
              children:
                  technologies.map((item) => Chip(label: Text(item))).toList(),
            ),
            // Flexible(
            //   child: Text(
            //     description,
            //     maxLines: 2,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            Text(year.toString()),
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
      ),
    );
  }
}
