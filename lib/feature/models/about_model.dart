import 'package:equatable/equatable.dart';

class AboutModel extends Equatable {
  final String title;
  final String historyLabel;
  final String history;
  final String technologiesLabel;
  final List<String> technologies;
  final String othersLabel;
  final List<String> others;

  const AboutModel({
    required this.title,
    required this.historyLabel,
    required this.history,
    required this.technologiesLabel,
    required this.technologies,
    required this.othersLabel,
    required this.others,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      title: json['title'],
      historyLabel: json['history_label'],
      history: json['history'],
      technologiesLabel: json['technologies_label'],
      technologies: List<String>.from(json['technologies']),
      othersLabel: json['others_label'],
      others: List<String>.from(json['others']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'history_label': historyLabel,
      'history': history,
      'technologies_label': technologiesLabel,
      'technologies': technologies,
      'others_label': othersLabel,
      'others': others,
    };
  }

  @override
  List<Object?> get props => [
        title,
        historyLabel,
        history,
        technologiesLabel,
        technologies,
        othersLabel,
        others,
      ];
}
