import 'package:equatable/equatable.dart';
import 'about_model.dart';
import 'contact_model.dart';
import 'initial_model.dart';
import 'project_model.dart';

class Response extends Equatable {
  final InitialModel initial;
  final AboutModel about;
  final ProjectsModel projects;
  final ContactModel contact;

  const Response({
    required this.initial,
    required this.about,
    required this.projects,
    required this.contact,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      initial: InitialModel.fromJson(json['initial']),
      about: AboutModel.fromJson(json['about']),
      projects: ProjectsModel.fromJson(json['projects']),
      contact: ContactModel.fromJson(json['contact']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'initial': initial.toJson(),
      'about': about.toJson(),
      'projects': projects.toJson(),
      'contact': contact.toJson(),
    };
  }

  @override
  List<Object?> get props => [initial, about, projects, contact];
}
