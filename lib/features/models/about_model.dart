import 'package:equatable/equatable.dart';

class AboutModel extends Equatable {
  final String title;
  final String history;
  final List<String> technologies;
  final List<String> others;

  const AboutModel({
    required this.title,
    required this.history,
    required this.technologies,
    required this.others,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      title: json['title'],
      history: json['history'],
      technologies: List<String>.from(json['technologies']),
      others: List<String>.from(json['others']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'history': history,
      'technologies': technologies,
      'others': others,
    };
  }

  @override
  List<Object?> get props => [title, history, technologies, others];
}
