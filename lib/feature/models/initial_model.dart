import 'package:equatable/equatable.dart';

class InitialModel extends Equatable {
  final String name;
  final String role;
  final String description;
  final String photo;
  final List<ButtonModel> buttons;

  const InitialModel({
    required this.name,
    required this.role,
    required this.description,
    required this.photo,
    required this.buttons,
  });

  factory InitialModel.fromJson(Map<String, dynamic> json) {
    return InitialModel(
      name: json['name'],
      role: json['role'],
      description: json['description'],
      photo: json['photo'],
      buttons: (json['buttons'] as List)
          .map((e) => ButtonModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'description': description,
      'photo': photo,
      'buttons': buttons.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [name, role, description, photo, buttons];
}

class ButtonModel extends Equatable {
  final String text;
  final String url;

  const ButtonModel({
    required this.text,
    required this.url,
  });

  factory ButtonModel.fromJson(Map<String, dynamic> json) {
    return ButtonModel(
      text: json['text'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [text, url];
}
