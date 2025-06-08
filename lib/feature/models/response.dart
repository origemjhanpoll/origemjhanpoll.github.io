import 'package:equatable/equatable.dart';
import 'about_model.dart';
import 'initial_model.dart';
import 'project_model.dart';

class Response extends Equatable {
  final InitialModel initial;
  final AboutModel about;
  final List<ProjectModel> projects;

  const Response({
    required this.initial,
    required this.about,
    required this.projects,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      initial: InitialModel.fromJson(json['initial']),
      about: AboutModel.fromJson(json['about']),
      projects: (json['projects'] as List)
          .map((e) => ProjectModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'initial': initial.toJson(),
      'about': about.toJson(),
      'projects': projects.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [initial, about, projects];
}
