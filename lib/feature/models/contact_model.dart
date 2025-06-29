import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String title;
  final String description;
  final List<ContactItem> contactItems;

  const ContactModel({
    required this.title,
    required this.description,
    required this.contactItems,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      title: json['title'],
      description: json['description'],
      contactItems: (json['contact_items'] as List)
          .map((item) => ContactItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'contact_items': contactItems.map((item) => item.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        title,
        description,
        contactItems,
      ];
}

class ContactItem extends Equatable {
  final String title;
  final String value;
  final String icon;
  final String url;
  final ContactType type;

  const ContactItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.url,
    required this.type,
  });

  factory ContactItem.fromJson(Map<String, dynamic> json) {
    return ContactItem(
      title: json['title'],
      value: json['value'],
      icon: json['icon'],
      url: json['url'],
      type: ContactType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => ContactType.email,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'value': value,
      'icon': icon,
      'url': url,
      'type': type.toString().split('.').last,
    };
  }

  @override
  List<Object?> get props => [
        title,
        value,
        icon,
        url,
        type,
      ];
}

enum ContactType {
  email,
  phone,
  whatsapp,
  linkedin,
  github,
}
