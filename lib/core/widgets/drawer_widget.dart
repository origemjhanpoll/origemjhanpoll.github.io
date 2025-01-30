import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origemjhanpoll_github_io/core/controllers/theme_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<int> onMenuClick;
  const DrawerWidget({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    final isDarkMode = context.watch<ThemeCubit>().state;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Jean',
                        style: theme.textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.w900),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Paul', style: theme.textTheme.titleLarge),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: context.read<ThemeCubit>().toggleTheme,
                      icon: Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: theme.primaryColor),
            title:
                Text(localization.menuHome, style: theme.textTheme.labelLarge),
            onTap: () {
              onMenuClick(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: theme.primaryColor),
            title:
                Text(localization.menuAbout, style: theme.textTheme.labelLarge),
            onTap: () {
              onMenuClick(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.work, color: theme.primaryColor),
            title: Text(localization.menuProject,
                style: theme.textTheme.labelLarge),
            onTap: () {
              onMenuClick(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.article, color: theme.primaryColor),
            title: Text(localization.menuArticle,
                style: theme.textTheme.labelLarge),
            onTap: () {
              onMenuClick(4);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.mail, color: theme.primaryColor),
            title: Text(localization.menuContact,
                style: theme.textTheme.labelLarge),
            onTap: () {
              onMenuClick(5);
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 30),
            child: Text(
              '© 2025 Jean Paul',
              style: theme.textTheme.bodySmall!
                  .copyWith(color: Colors.white.withValues(alpha: 0.5)),
            ),
          )
        ],
      ),
    );
  }
}
