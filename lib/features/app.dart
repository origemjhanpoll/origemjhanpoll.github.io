import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:origemjhanpoll_github_io/core/controllers/theme_controller.dart';
import 'package:origemjhanpoll_github_io/core/theme/theme.dart';
import 'package:origemjhanpoll_github_io/features/views/home_page.dart';

import '../l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'origemjhanpoll',
          theme: isDarkMode ? AppTheme.dark : AppTheme.light,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
            Locale('pt', 'BR'),
          ],
          locale: const Locale('pt', 'BR'),
          home: const HomePage(),
        );
      },
    );
  }
}
