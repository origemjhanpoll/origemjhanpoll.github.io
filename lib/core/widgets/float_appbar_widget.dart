import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:origemjhanpoll_github_io/core/constants/screen_size.dart';
import 'package:origemjhanpoll_github_io/core/constants/spacing_size.dart';
import 'package:origemjhanpoll_github_io/core/controllers/theme_controller.dart';
import 'package:origemjhanpoll_github_io/core/controllers/language_controller.dart';

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
    final isDarkMode = context.watch<ThemeCubit>().state;
    final languageState = context.watch<LanguageCubit>().state;

    final tabs = [
      ItemTab(icon: Icons.circle, name: 'Home'),
      ItemTab(icon: Icons.circle, name: 'About'),
      ItemTab(icon: Icons.circle, name: 'Projects'),
      ItemTab(icon: Icons.contact_mail, name: 'Contact'),
      // ItemTab(icon: Icons.circle, name: 'Articles'),
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
                itemCount: tabs.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final tab = tabs[index];

                  if (!isScreenMedium) {
                    return IconButton(
                      iconSize: 18.0,
                      icon: Icon(tab.icon),
                      onPressed: () => widget.onPage(index),
                    );
                  }
                  return TextButton(
                    onPressed: () => widget.onPage(index),
                    child: Text(tab.name.toUpperCase(),
                        style: theme.textTheme.labelLarge!
                            .copyWith(fontWeight: FontWeight.w200)),
                  );
                },
              ),
            ),
            _BlurWidget(
              fixedSize: Size.square(48.0),
              child: IconButton(
                onPressed: context.read<LanguageCubit>().toggleLanguage,
                style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: Text(
                  languageState.displayName,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            _BlurWidget(
              fixedSize: Size.square(48.0),
              child: IconButton(
                onPressed: context.read<ThemeCubit>().toggleTheme,
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
  const _BlurWidget({
    required this.child,
    this.fixedSize,
  });

  final Widget child;
  final Size? fixedSize;

  @override
  Widget build(BuildContext context) {
    final blurWidget = ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: DecoratedBox(
            decoration:
                BoxDecoration(color: Colors.blueGrey.withValues(alpha: 0.1)),
            child: fixedSize != null ? Center(child: child) : child),
      ),
    );

    if (fixedSize != null) {
      return SizedBox(
        width: fixedSize!.width,
        height: fixedSize!.height,
        child: blurWidget,
      );
    }

    return blurWidget;
  }
}
