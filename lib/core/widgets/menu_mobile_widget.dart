import 'package:flutter/material.dart';
import 'package:origemjhanpoll_github_io/core/theme/extension/color_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuMobileWidget extends StatelessWidget {
  final ValueChanged<int> onMenuClick;
  const MenuMobileWidget({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<ColorExtension>()!;
    final localization = AppLocalizations.of(context)!;

    return Drawer(
      backgroundColor: colors.menuBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: colors.drawerMenuIconColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // SizedBox(
            //   height: 100,
            //   child: Image.asset('assets/images/contact-me.png'),
            // ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Jean',
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w900),
                  children: <TextSpan>[
                    TextSpan(text: 'Paul', style: theme.textTheme.titleLarge),
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         themeController.toggleTheme();
            //       },
            //       icon: Image.asset(
            //         themeController.isLight
            //             ? 'assets/icons/sun.png'
            //             : 'assets/icons/moon.png',
            //         height: 32,
            //       ),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         languageController.toggleLanguage();
            //       },
            //       icon: Image.asset(
            //         languageController.isPortuguese
            //             ? 'assets/icons/pt_lula.png'
            //             : 'assets/icons/en.png',
            //         height: 14,
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.white.withValues(alpha: 0.5)),
            ),
            ListTile(
              leading: Icon(Icons.home, color: colors.drawerMenuIconColor),
              title: Text(localization.menuHome,
                  style: theme.textTheme.labelLarge),
              onTap: () {
                onMenuClick(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: colors.drawerMenuIconColor),
              title: Text(localization.menuAbout,
                  style: theme.textTheme.labelLarge),
              onTap: () {
                onMenuClick(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: colors.drawerMenuIconColor),
              title: Text(localization.menuProject,
                  style: theme.textTheme.labelLarge),
              onTap: () {
                onMenuClick(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.article, color: colors.drawerMenuIconColor),
              title: Text(localization.menuArticle,
                  style: theme.textTheme.labelLarge),
              onTap: () {
                onMenuClick(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.mail, color: colors.drawerMenuIconColor),
              title: Text(localization.menuContact,
                  style: theme.textTheme.labelLarge),
              onTap: () {
                onMenuClick(5);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
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
      ),
    );
  }
}
