import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  final String title;
  final String description;
  final List<String> technologies;
  final String? url;
  final String? github;
  final int? year;
  final List<String>? types;
  final String? playstore;
  final String? appstore;
  final List<String>? images;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    this.url,
    this.github,
    this.year,
    this.types,
    this.playstore,
    this.appstore,
    this.images,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'],
      description: json['description'],
      technologies: List<String>.from(json['technologies']),
      url: json['url'],
      github: json['github'],
      year: json['year'],
      types: List<String>.from(json['types']),
      playstore: json['playstore'],
      appstore: json['appstore'],
      images: List<String>.from(json['images'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'technologies': technologies,
      'url': url,
      'github': github,
      'year': year,
      'types': types,
      'playstore': playstore,
      'appstore': appstore,
      'images': images,
    };
  }

  @override
  List<Object?> get props => [
        title,
        description,
        technologies,
        url,
        github,
        year,
        types,
        playstore,
        appstore,
        images,
      ];
}

class ProjectsSectionModel extends Equatable {
  final String title;
  final List<ProjectModel> items;

  const ProjectsSectionModel({
    required this.title,
    required this.items,
  });

  factory ProjectsSectionModel.fromJson(Map<String, dynamic> json) {
    return ProjectsSectionModel(
      title: json['title'],
      items: (json['items'] as List)
          .map((item) => ProjectModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [title, items];
}
