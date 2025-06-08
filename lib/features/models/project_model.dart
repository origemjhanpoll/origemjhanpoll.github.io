import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String title;
  final String description;
  final List<String> technologies;
  final String image;
  final String url;
  final String github;
  final int year;
  final List<String> types;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.image,
    required this.url,
    required this.github,
    required this.year,
    required this.types,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
      image: json['image'],
      url: json['url'],
      github: json['github'],
      year: json['year'],
      types: List<String>.from(json['types']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'technologies': technologies,
      'image': image,
      'url': url,
      'github': github,
      'year': year,
      'types': types,
    };
  }

  @override
  List<Object?> get props => [
        title,
        description,
        technologies,
        image,
        url,
        github,
        year,
        types,
      ];
}
