import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        // IconButton(
        //   onPressed: () {
        //     languageController.toggleLanguage();
        //   },
        //   icon: Image.asset(
        //     languageController.isPortuguese
        //         ? 'assets/icons/pt_lula.png'
        //         : 'assets/icons/en.png',
        //     height: size.height * 0.012,
        //   ),
        // ),

        // IconButton(
        //   onPressed: () {
        //     themeController.toggleTheme();
        //   },
        //   icon: Image.asset(
        //     themeController.isLight
        //         ? 'assets/icons/sun.png'
        //         : 'assets/icons/moon.png',
        //     height: size.height * 0.025,
        //   ),
        // ),
      ],
    );
  }
}
