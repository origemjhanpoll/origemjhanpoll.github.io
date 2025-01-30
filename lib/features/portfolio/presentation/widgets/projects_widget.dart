import 'package:flutter/material.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: size.height),
        child: const Placeholder(
          child: Center(child: Text('Projects')),
        ));
  }
}
