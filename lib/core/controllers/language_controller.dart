import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

enum Language { english, portuguese, chinese }

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
      : super(const LanguageState(currentLanguage: Language.portuguese));

  void toggleLanguage() {
    final newLanguage = _nextLanguage(state.currentLanguage);
    emit(LanguageState(currentLanguage: newLanguage));
  }

  void setLanguage(Language language) {
    emit(LanguageState(currentLanguage: language));
  }
}

class LanguageState extends Equatable {
  final Language currentLanguage;

  const LanguageState({required this.currentLanguage});

  @override
  List<Object?> get props => [currentLanguage];

  String get languageCode {
    switch (currentLanguage) {
      case Language.english:
        return 'en';
      case Language.portuguese:
        return 'pt_br';
      case Language.chinese:
        return 'zh';
    }
  }

  String get displayName {
    switch (currentLanguage) {
      case Language.english:
        return '🇺🇸';
      case Language.portuguese:
        return '🇧🇷';
      case Language.chinese:
        return '🇨🇳';
    }
  }
}

Language _nextLanguage(Language current) {
  switch (current) {
    case Language.english:
      return Language.portuguese;
    case Language.portuguese:
      return Language.chinese;
    case Language.chinese:
      return Language.english;
  }
}
