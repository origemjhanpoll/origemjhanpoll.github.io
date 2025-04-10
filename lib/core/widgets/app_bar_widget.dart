import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origemjhanpoll_github_io/core/controllers/theme_controller.dart';

import '../../l10n/app_localizations.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<int> onPage;

  const AppBarWidget({super.key, required this.onPage});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;

    final isDarkMode = context.watch<ThemeCubit>().state;

    final localizationTabs = [
      localization.menuHome,
      localization.menuAbout,
      localization.menuExperiences,
      localization.menuProject,
      localization.menuArticle,
      localization.menuContact,
    ];

    return AppBar(
      titleSpacing: size.width * 0.02,
      forceMaterialTransparency: true,
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
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: localizationTabs.length,
          shrinkWrap: true,
          itemBuilder: (_, index) => TextButton(
            onPressed: () => onPage(index),
            child: Text(localizationTabs[index],
                style: theme.textTheme.labelLarge),
          ),
        ),
        IconButton(
          onPressed: context.read<ThemeCubit>().toggleTheme,
          icon: Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
          ),
        ),
        // TextButton(
        //   onPressed: () {},
        //   style: ButtonStyle(
        //     padding: WidgetStatePropertyAll(EdgeInsets.zero),
        //     minimumSize: WidgetStatePropertyAll(Size(40.0, 40.0)),
        //     maximumSize: WidgetStatePropertyAll(Size(40.0, 40.0)),
        //     fixedSize: WidgetStatePropertyAll(Size(40.0, 40.0)),
        //   ),
        //   child: Text('PT', style: theme.textTheme.labelLarge),
        // ),
      ],
    );
  }
}
