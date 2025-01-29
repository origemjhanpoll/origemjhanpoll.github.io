import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:origemjhanpoll_github_io/core/controllers/theme_controller.dart';

class MenuWebWidget extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<int> onMenuClick;

  const MenuWebWidget({super.key, required this.onMenuClick});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    final isDarkMode = context.watch<ThemeCubit>().state;

    return AppBar(
      titleSpacing: size.width * 0.02,
      title: RichText(
        text: TextSpan(
          text: 'Jean',
          style:
              theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w900),
          children: <TextSpan>[
            TextSpan(text: 'Paul', style: theme.textTheme.titleLarge),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => onMenuClick(1),
          child: Text(localization.menuHome, style: theme.textTheme.labelLarge),
        ),
        TextButton(
          onPressed: () => onMenuClick(2),
          child:
              Text(localization.menuAbout, style: theme.textTheme.labelLarge),
        ),
        TextButton(
          onPressed: () => onMenuClick(3),
          child:
              Text(localization.menuProject, style: theme.textTheme.labelLarge),
        ),
        TextButton(
          onPressed: () => onMenuClick(4),
          child:
              Text(localization.menuArticle, style: theme.textTheme.labelLarge),
        ),
        TextButton(
          onPressed: () => onMenuClick(5),
          child:
              Text(localization.menuContact, style: theme.textTheme.labelLarge),
        ),
        IconButton(
          onPressed: context.read<ThemeCubit>().toggleTheme,
          icon: Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
          ),
        ),
      ],
    );
  }
}
