import 'package:equatable/equatable.dart';
import 'about_model.dart';
import 'initial_model.dart';
import 'project_model.dart';

class Response extends Equatable {
  final InitialModel initial;
  final AboutModel about;
  final ProjectsModel projects;

  const Response({
    required this.initial,
    required this.about,
    required this.projects,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      initial: InitialModel.fromJson(json['initial']),
      about: AboutModel.fromJson(json['about']),
      projects: ProjectsModel.fromJson(json['projects']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'initial': initial.toJson(),
      'about': about.toJson(),
      'projects': projects.toJson(),
    };
  }

  @override
  List<Object?> get props => [initial, about, projects];
}
