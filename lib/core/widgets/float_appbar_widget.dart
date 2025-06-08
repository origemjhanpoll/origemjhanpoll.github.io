import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/controllers/theme_controller.dart';
import 'package:origemjhanpoll_github_io/l10n/app_localizations.dart';

class ItemTab {
  final String name;
  final IconData icon;
  const ItemTab({required this.name, required this.icon});
}

class FloatAppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<int> onPage;
  const FloatAppbarWidget({super.key, required this.onPage});

  @override
  State<FloatAppbarWidget> createState() => _FloatAppbarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FloatAppbarWidgetState extends State<FloatAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = AppLocalizations.of(context)!;
    final isDarkMode = context.watch<ThemeCubit>().state;

    final localizationTabs = [
      ItemTab(icon: Icons.circle, name: localization.menuHome),
      ItemTab(icon: Icons.circle, name: localization.menuAbout),
      ItemTab(icon: Icons.circle, name: localization.menuProject),
      // ItemTab(icon: Icons.circle, name: localization.menuArticle),
      // ItemTab(icon: Icons.circle, name: localization.menuContact),
    ];

    return LayoutBuilder(builder: (context, constraints) {
      final isScreenMedium = constraints.maxWidth >= ScreenSize.small;
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: kBottomNavigationBarHeight,
          maxHeight: kBottomNavigationBarHeight,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: SpacingSize.small,
          children: [
            _BlurWidget(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                itemCount: localizationTabs.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final tab = localizationTabs[index];

                  if (!isScreenMedium) {
                    return IconButton(
                      iconSize: 18.0,
                      icon: Icon(tab.icon),
                      onPressed: () => widget.onPage(index),
                    );
                  }
                  return TextButton(
                    onPressed: () => widget.onPage(index),
                    child: Text(tab.name, style: theme.textTheme.labelLarge),
                  );
                },
              ),
            ),
            _BlurWidget(
              child: IconButton(
                onPressed: context.read<ThemeCubit>().toggleTheme,
                padding: EdgeInsets.all(14),
                icon: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _BlurWidget extends StatelessWidget {
  const _BlurWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: DecoratedBox(
            decoration:
                BoxDecoration(color: Colors.blueGrey.withValues(alpha: 0.1)),
            child: child),
      ),
    );
  }
}
