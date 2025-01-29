import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false); // false representa o tema claro

  void toggleTheme() {
    emit(!state); // Alterna entre true e false
  }
}
