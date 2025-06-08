import 'package:flutter/material.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          43,
          (i) => Container(
                margin: EdgeInsets.all(16),
                height: 80,
                color: Colors.amber,
                child: Center(
                    child: Text(
                  i.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                )),
              )),
    );
  }
}
