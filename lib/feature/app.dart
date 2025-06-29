import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origemjhanpoll_github_io/core/controllers/theme_controller.dart';
import 'package:origemjhanpoll_github_io/core/controllers/language_controller.dart';
import 'package:origemjhanpoll_github_io/core/theme/theme.dart';
import 'package:origemjhanpoll_github_io/feature/views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'origemjhanpoll',
            theme: isDarkMode ? AppTheme.dark : AppTheme.light,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
